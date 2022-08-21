import 'package:cats/bloc/bloc_fact.dart';
import 'package:cats/bloc/event_bloc_fact.dart';
import 'package:cats/bloc/state_bloc_fact.dart';
import 'package:cats/model/fact.dart';
import 'package:cats/views/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_gifs/loading_gifs.dart';

class PageAllFacts extends StatefulWidget {
  const PageAllFacts({Key? key}) : super(key: key);

  @override
  State<PageAllFacts> createState() => _PageAllFactsState();
}

class _PageAllFactsState extends State<PageAllFacts> {
  List<Fact> _facts = [];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BlocFact>().state;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    context.read<BlocFact>().add(EventDeleteFact());
                  });
                },
                icon: Icon(Icons.delete))
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.read<BlocFact>().emit(StateFactLoading());
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: Utils.gradientHome(),
            ),
            child: _buildListFacts(state)));
  }

  Widget _buildListFacts(StateFact state) {
    if (state is StateFactsAll) {
      _facts = state.factsSaved;
      return ListView.builder(
        itemCount: _facts.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(gradient: index % 2 == 0 ? Utils.gradientAllFactCard1() : Utils.gradientAllFactCard2()),
          child: ListTile(
            subtitle: Text(
              ' ${_facts[index].createdDate}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Column(
              children: [
                Text(
                  _facts[index].text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Center(child: Image.asset(cupertinoActivityIndicator));
    }
  }
}
