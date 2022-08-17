


import 'package:cats/model/fact.dart';

abstract class EventFact {}
class EventFactLoad extends EventFact {}
class EventFactNext extends EventFact {
  //Fact readedFact;

 // EventFactNext(this.readedFact);
}
class EventFactAll extends EventFact {}