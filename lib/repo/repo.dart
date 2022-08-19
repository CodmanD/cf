import 'dart:math';
import 'package:cats/model/fact.dart';
import 'package:cats/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Repositories {
  static final client = RestClient(Dio(BaseOptions(contentType: "application/json")));

  static List<Fact> _facts = [];

  static Future<void> init() async {
    final dbDir = await getApplicationDocumentsDirectory();
    Hive
      ..init(dbDir.path)
      ..registerAdapter(FactAdapter());
  }

  static Future<List<Fact>> fetchFacts() async {
    return await client.getFact();
  }

  static Future<Fact> getRandomFact() async {
    if (_facts.isEmpty) {
      _facts = await client.getFact();
    }
    return _facts[Random().nextInt(_facts.length)];
  }

  static saveFact(Fact fact) async {
    var box = await Hive.openBox<Fact>('facts');
    await box.add(fact);
    var value = await box.getAt(0);
  }

  static Future<List<Fact>> getSavedFacts() async {
    var box = await Hive.openBox<Fact>('facts');
    var facts = box.values.toList();
    return facts;
  }
}
