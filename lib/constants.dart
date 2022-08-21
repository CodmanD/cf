import 'package:cats/views/page_all_facts.dart';
import 'package:cats/views/page_home.dart';
import 'package:flutter/material.dart';

const URL_IMAGE = 'https://cataas.com/cat';
// const BASE_URL ="https://cat-fact.herokuapp.com/";
// const FACTS_URL ="facts";
const BASE_URL = "http://192.168.0.101/facts/";
const FACTS_URL = "f.json";

const PAGE_HOME_ROUTE = '/home';
const PAGE_ALL_ROUTE = '/all';
const TITLE_APP = 'CAT FACTS';

final Map<String, WidgetBuilder> ROUTES = <String, WidgetBuilder>{
  PAGE_HOME_ROUTE: (context) => const PageHome(),
  PAGE_ALL_ROUTE: (context) => const PageAllFacts(),
};

const gradienCard = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [

  ],
);
