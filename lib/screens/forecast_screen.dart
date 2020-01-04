import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

import '../utilities/constants.dart';

//Todo: add an exception that when Error is in  Location Screen
// Todo:  don't make weather data parameter as compulsory as empty data can be passed on error
class ForecastScreen extends StatefulWidget {
  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kGradientBackground,
        child: SafeArea(
          child: Text(''),
        ),
      ),
    );
  }
}
