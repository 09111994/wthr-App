import 'package:flutter/material.dart';
import 'package:weather_ap/screens/homescreen.dart';

void main() {
  runApp(Weatherapp());
}

class Weatherapp extends StatelessWidget {
  Weatherapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
