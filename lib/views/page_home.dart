import 'package:cats/bloc/bloc_fact.dart';
import 'package:cats/bloc/event_bloc_fact.dart';
import 'package:cats/bloc/state_bloc_fact.dart';
import 'package:cats/constants.dart';
import 'package:cats/model/fact.dart';
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

  GlobalKey _keyImage = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(TITLE_APP), centerTitle: true),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () {
          setState(() {
            {
              _keyImage = GlobalKey();
              context.read<BlocFact>().add(EventFactNext());
            }
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    final state = context.watch<BlocFact>().state;
    if (state is StateFactLoading) {
      context.watch<BlocFact>().add(EventFactLoad());
      return const Center(child: CircularProgressIndicator());
    } else if (state is StateFactLoaded) {
      _fact = state.fact;
      return Column(children: [
        Center(
          child: Text(_fact.text, style: Theme.of(context).textTheme.headlineSmall),
        ),
        _buildImage(),
        IconButton(
          icon: const Icon(Icons.library_books),
          onPressed: () async {
            context.read<BlocFact>().add(EventFactAll());
            await Navigator.pushNamed(context, PAGE_ALL_ROUTE);
          },
        )
      ]);
    } else {
      return const CircularProgressIndicator();
    }
  }

  Widget _buildImage() {
    return Flexible(
      child: Center(
        child: FadeInImage.assetNetwork(
          imageErrorBuilder: (_, __, ___) {
            return const Text('ERROR 404');
          },
          key: _keyImage,
          fit: BoxFit.cover,
          placeholder: cupertinoActivityIndicator,
          image: URL_IMAGE,
        ),
      ),
    );
  }
}
