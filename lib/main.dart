import 'package:cats/constants.dart';
import 'package:cats/views/page_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc_fact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocFact(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: ROUTES,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PageHome(),
      ),
    );
  }
}
