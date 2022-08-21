import 'dart:math';
import 'package:cats/constants.dart';
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
    var box = await Hive.openBox<Fact>(FACTS_URL);
    await box.add(fact);
    await box.close();
  }

  static deleteFacts() async {
    var box = await Hive.openBox<Fact>(FACTS_URL);
    await box.delete(FACTS_URL);
    await box.clear();
    await box.close();
  }

  static Future<List<Fact>> getSavedFacts() async {
    var box = await Hive.openBox<Fact>(FACTS_URL);
    var facts = box.values.toList();
    await box.close();
    return facts;
  }
}
