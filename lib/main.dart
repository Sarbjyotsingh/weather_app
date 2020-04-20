import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/screens/loading_screen.dart';

import 'screens/city_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Forcing Portrait orientation in device for App
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      routes: {
        '/CityScreen': (context) => CityScreen(),
      },
      home: LoadingScreen(),
    );
  }
}
