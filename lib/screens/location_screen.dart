import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:weather_app/services/formatted_date_time.dart';
import 'package:weather_app/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({@required this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _currentDateTime;
  @override
  void initState() {
    super.initState();
    getCurrentDateTimeString();
    Timer.periodic(
        Duration(seconds: 1), (Timer t) => getCurrentDateTimeString());
  }

  void getCurrentDateTimeString() {
    String timeString =
        FormattedDateTime(dateTime: DateTime.now()).getFormattedDateTime();
    setState(() {
      _currentDateTime = timeString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kGradientBackground,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.gps_fixed),
                            color: Colors.white,
                            iconSize: 33,
                            onPressed: () {
                              // Todo:Get weather Data and update UI on set State
                            },
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: Text(
                              'Hong Kong',
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                            ),
                            iconSize: 33,
                            onPressed: () {
                              Navigator.pushNamed(context, '/CityScreen');
                            },
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        _currentDateTime,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          WeatherIcons.wi_moon_waning_crescent_2,
                          size: 40.0,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Clear',
                          style: TextStyle(fontSize: 50),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '23',
                          style: TextStyle(
                            fontSize: 100,
                          ),
                        ),
                        Text(
                          '⁰',
                          style: TextStyle(fontSize: 80),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
