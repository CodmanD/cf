import 'package:cats/bloc/bloc_fact.dart';
import 'package:cats/bloc/event_bloc_fact.dart';
import 'package:cats/bloc/state_bloc_fact.dart';
import 'package:cats/model/fact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageAllFacts extends StatefulWidget {
  const PageAllFacts({Key? key}) : super(key: key);

  @override
  State<PageAllFacts> createState() => _PageAllFactsState();
}

class _PageAllFactsState extends State<PageAllFacts> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<BlocFact>().state;

    //List<Fact> facts = (context.watch<BlocFact>().state as StateFactsAll).factsSaved;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.read<BlocFact>().add(EventFactNext());
            Navigator.of(context).pop();
          },
        ),
      ),
      body: (state is StateFactsAll) ? _buildListFacts(state) : CircularProgressIndicator(),
    );
  }

  Widget _buildListFacts(StateFact state) {
    List<Fact> facts = (state as StateFactsAll).factsSaved;
    return ListView.builder(
      itemCount: facts.length,
      itemBuilder: (context, index) => Container(
        color: index % 2 == 0 ? Colors.white : Colors.blue[50],
        child: ListTile(
          leading: Text(
            ' ${facts[index].createdDate}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          title: Column(
            children: [
              Text(
                facts[index].text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
