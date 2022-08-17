import 'dart:math';

import 'package:cats/constants.dart';
import 'package:cats/model/fact.dart';
import 'package:cats/network/api_service.dart';
import 'package:cats/views/page_home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'bloc/bloc_fact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return BlocProvider(
      create: (context) => BlocFact(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes:ROUTES,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const PageHome() ,
        //const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexFact = 0;
  int _max = 0;
  String urlImage = 'https://cataas.com/cat';





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _buildBody(context),
      ),

      floatingActionButton: const FloatingActionButton(
        onPressed:null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }




  FutureBuilder<List<Fact>>? _buildBody(BuildContext context) {
    final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<Fact>>(
      future: client.getFact(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {

          final List<Fact> facts = snapshot.requireData;
          //get random fact,if i understand the task correctly
          _max = facts.length;

          // _setImage();

          String text = facts[_indexFact].text;


          return Container();
        }
        return Container();
      },
    );
  }
}
