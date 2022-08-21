import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static gradientCard() {
    return const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
      Colors.greenAccent,
      Colors.white,
      Colors.greenAccent,
    ]);
  }

  static gradientHome() {
    return const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
      Colors.black12,
      Colors.white,
      Colors.black12,
    ]);
  }

  static gradientAllFactCard1() {
    return  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.purple.shade100,
        Colors.white,
        Colors.purple.shade100,
      ],
    );
  }

  static gradientButtonAllFacts() {
    return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
      Colors.deepPurple.shade400,
      Colors.deepPurple.shade200,
      Colors.green.shade200,
    ]);
  }

  static gradientAllFactCard2() {
    return const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
      Colors.greenAccent,
      Colors.white,
      Colors.greenAccent,
    ]);
  }
}
