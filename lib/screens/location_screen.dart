import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/services/formatted_date_time.dart';
import 'package:weather_app/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.gps_fixed),
                        color: Colors.white,
                        iconSize: 33,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      flex: 7,
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
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  _currentDateTime,
                ),
              ),
              Spacer(
                flex: 5,
              ),
              Center(
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
