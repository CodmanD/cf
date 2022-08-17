import 'package:cats/bloc/bloc_fact.dart';
import 'package:cats/bloc/event_bloc_fact.dart';
import 'package:cats/bloc/state_bloc_fact.dart';
import 'package:cats/constants.dart';
import 'package:cats/model/fact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late Fact _fact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i) async {
            //print("----CLick $i");
            switch (i) {
              case 0:
                context.read<BlocFact>().add(EventFactAll());
                await Navigator.pushNamed(context, '/all');
                break;
              case 1:
                print("----CLick 1");
                context.read<BlocFact>().add(EventFactNext());
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.library_books), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.navigate_next), label: ""),
          ]),

      //_buildBottomNavigationBar(context),
    );
  }

  Widget _buildBody() {
    final state = context.watch<BlocFact>().state;
    if (state is StateFactLoading) {
      context.watch<BlocFact>().add(EventFactLoad());
      return const CircularProgressIndicator();
    } else if (state is StateFactLoaded) {
      _fact = state.fact;
      return Column(children: [
        Center(child: Text(_fact.text)),
        Flexible(
          child: Center(
              child: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            placeholder: kTransparentImage,
            image: URL_IMAGE,
          )),
        ),
      ]);
    } else
      return Container();
  }

// Widget _buildBottomNavigationBar(BuildContext c) {
//   return BottomNavigationBar(
//       onTap: (i) async{
//         print("----CLick index= $i");
//         switch (i) {
//           case 0:
//             print("----CLick push");
//             await Navigator.pushNamed(context,'/all');
//             break;
//           case 1:
//           print("----CLick 0");
//           context.watch<BlocFact>().add(EventFactNext(_fact));
//           print("----CLick STATE = " + context.watch<BlocFact>().state.toString());
//           break;
//
//         }
//       },
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.navigate_next), label: ""),
//         BottomNavigationBarItem(icon: Icon(Icons.repeat), label: ""),
//       ]);
// }
}
