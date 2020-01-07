import 'package:flutter/material.dart';

//Todo: add an exception that when Error is in  Location Screen
// Todo:  don't make weather data parameter as compulsory as empty data can be passed on error
class ForecastScreen extends StatefulWidget {
  final List<Color> gradientBackgroundColor;
  ForecastScreen({@required this.gradientBackgroundColor});

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
