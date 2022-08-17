import 'package:cats/views/page_all_facts.dart';
import 'package:cats/views/page_home.dart';
import 'package:flutter/material.dart';

const URL_IMAGE = 'https://cataas.com/cat';
const BASE_URL ="https://cat-fact.herokuapp.com/";
final Map<String, WidgetBuilder> ROUTES = <String, WidgetBuilder>{
  '/home': (context) => const PageHome(),
  '/all': (context) => const PageAllFacts(),

};