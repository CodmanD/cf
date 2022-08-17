import 'dart:math';

import 'package:cats/bloc/event_bloc_fact.dart';
import 'package:cats/bloc/state_bloc_fact.dart';
import 'package:cats/model/fact.dart';
import 'package:cats/network/api_service.dart';
import 'package:cats/repo/repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFact extends Bloc<EventFact, StateFact> {
  List<Fact> factsSaved = <Fact>[];
late Fact _fact;
  BlocFact() : super(StateFactLoading()) {
    Repositories.init();
    on<EventFactLoad>((event, emit) async {
      print("----eventFactLoad");

        _fact = await Repositories.getRandomFact();
       emit(StateFactLoaded(_fact));
    });
    on<EventFactNext>((event, emit) async {

      await Repositories.saveFact(_fact);
      _fact = await Repositories.getRandomFact();
      emit(StateFactLoaded(_fact));
    });
    on<EventFactAll>((event, emit) async {
     // emit(StateFactsAll(savedFacts));
      await Repositories.saveFact(_fact);

      List<Fact> savedFacts=await Repositories.getSavedFacts();
      emit(StateFactsAll(savedFacts));
    });
  }
}
