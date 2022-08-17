import 'package:cats/model/fact.dart';

abstract class StateFact {}

class StateFactLoading extends StateFact {}
class StateFactLoaded extends StateFact {
  Fact fact;
  StateFactLoaded(this.fact);
}
class StateFactsAll extends StateFact {
  List<Fact> factsSaved;
  StateFactsAll(this.factsSaved);
}