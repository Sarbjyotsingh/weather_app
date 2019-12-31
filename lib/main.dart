import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/forecast_screen.dart';
import 'package:weather_app/screens/loading_screen.dart';
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
      home: LoadingScreen(),
      routes: {
        '/LoadingScreen': (context) => LoadingScreen(),
        '/LocationScreen': (context) => LocationScreen(),
        '/CityScreen': (context) => CityScreen(),
        '/ForecastScreen': (context) => ForecastScreen(),
      },
    );
  }
}
