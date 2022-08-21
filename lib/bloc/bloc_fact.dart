import 'package:cats/bloc/event_bloc_fact.dart';
import 'package:cats/bloc/state_bloc_fact.dart';
import 'package:cats/model/fact.dart';
import 'package:cats/repo/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFact extends Bloc<EventFact, StateFact> {
  List<Fact> factsSaved = <Fact>[];
  late Fact _fact;

  BlocFact() : super(StateFactLoading()) {
    Repositories.init();
    on<EventFactLoad>((event, emit) async {
      _fact = await Repositories.getRandomFact();
      await Repositories.saveFact(_fact);
      emit(StateFactLoaded(_fact));
    });
    on<EventFactNext>((event, emit) async {
      _fact = await Repositories.getRandomFact();
      await Repositories.saveFact(_fact);
      emit(StateFactLoaded(_fact));
    });
    on<EventFactAll>((event, emit) async {
      List<Fact> savedFacts = await Repositories.getSavedFacts();
      emit(StateFactsAll(savedFacts));
    });

    on<EventDeleteFact>((event, emit) async {
      await Repositories.deleteFacts();
      emit(StateDeleteFact());
    });
  }
}
