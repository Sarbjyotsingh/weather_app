import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      home: LocationScreen(),
    );
  }
}
