import 'package:flutter/material.dart';

//Todo: add an exception that when Error is in  Location Screen
//Todo:  don't make weather data parameter as compulsory as empty data can be passed on error
//Todo: also get city name and check if city name is null and call API also
class ForecastScreen extends StatefulWidget {
  final List<Color> gradientBackgroundColor;
  final dynamic weatherData;
  ForecastScreen(
      {@required this.gradientBackgroundColor, @required this.weatherData});
  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: widget.gradientBackgroundColor,
          ),
        ),
        child: SafeArea(
          child: Text(''),
        ),
      ),
    );
  }
}
