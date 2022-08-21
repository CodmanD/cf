import 'dart:async';

import 'package:cats/bloc/bloc_fact.dart';
import 'package:cats/bloc/event_bloc_fact.dart';
import 'package:cats/bloc/state_bloc_fact.dart';
import 'package:cats/constants.dart';
import 'package:cats/model/fact.dart';
import 'package:cats/views/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_gifs/loading_gifs.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late Fact _fact;
  UniqueKey _keyImage = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  void _nextFact() {
    setState(() {
      {
        print("-------clickNextFact");
        _keyImage = UniqueKey();
        context.read<BlocFact>().add(EventFactNext());
      }
    });
  }

  void _routeToAllFacts() async {
    context.read<BlocFact>().add(EventFactAll());
    await Navigator.pushNamed(context, PAGE_ALL_ROUTE);
  }

  void _swipeHorizontal(details) {
    int sensitivity = 50;
    if (details.delta.dx > sensitivity) {
      // Right Swipe
      _nextFact();
    } else if (details.delta.dx < -sensitivity) {
      //Left Swipe
      _nextFact();
    }
    ;
  }

  Widget _buildBody() {
    final state = context.watch<BlocFact>().state;
    if (state is StateFactLoading) {
      context.watch<BlocFact>().add(EventFactLoad());
      return const Center(child: CircularProgressIndicator());
    } else if (state is StateFactLoaded) {
      _fact = state.fact;
      return GestureDetector(
        onHorizontalDragUpdate: _swipeHorizontal,
        child: Stack(children: [
          _buildImage(),
          _buildCard(),
          Align(alignment: Alignment.bottomCenter, child: _buildButton()),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                icon: const Icon(
                  Icons.navigate_next,
                  color: Colors.greenAccent,
                ),
                onPressed: _nextFact),
          )
        ]),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.greenAccent, offset: Offset(0, 5), blurRadius: 5)],
          gradient: Utils.gradientButtonAllFacts(),
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(150, 50)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: _routeToAllFacts,
          child: const Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Icon(
              Icons.line_weight_sharp,
              color: Colors.greenAccent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(gradient: Utils.gradientHome()),
      child: Center(
        child: FadeInImage.assetNetwork(
          key: _keyImage,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/cat.png',
            );
          },
          fit: BoxFit.fitWidth,
          placeholder: cupertinoActivityIndicator,
          image: URL_IMAGE,
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.deepPurpleAccent, //<-- SEE HERE
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: Utils.gradientCard()),
              child: Text(_fact.text, style: Theme.of(context).textTheme.headlineSmall)),
        ),
      ),
    );
  }
}
