import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:weather_app/services/formatted_date_time.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/widgets/detail_card_widget.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({@required this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _currentDateTime;
  bool _celsiusButtonStatus;
  bool _fahrenheitButtonStatus;
  var _celsiusButtonColor;
  var _fahrenheitButtonColor;
  double _celsiusButtonElevation;
  double _fahrenheitButtonElevation;

  @override
  void initState() {
    super.initState();
    getCurrentDateTimeString();
    Timer.periodic(
        Duration(seconds: 1), (Timer t) => getCurrentDateTimeString());
    _celsiusButtonStatus = true;
    _celsiusButtonColor = kEnabledButtonColor;
    _celsiusButtonElevation = kEnabledButtonElevation;
    _fahrenheitButtonStatus = false;
    _fahrenheitButtonColor = kDisabledButtonColor;
    _fahrenheitButtonElevation = kDisabledButtonElevation;
  }

  void getCurrentDateTimeString() {
    String timeString =
        FormattedDateTime(dateTime: DateTime.now()).getFormattedDateTime();
    setState(() {
      _currentDateTime = timeString;
    });
  }

  void _changeUnitSystemToCelsius() {
    if (!_celsiusButtonStatus) {
      setState(() {
        _celsiusButtonStatus = true;
        _celsiusButtonColor = kEnabledButtonColor;
        _celsiusButtonElevation = kEnabledButtonElevation;
        _fahrenheitButtonStatus = false;
        _fahrenheitButtonColor = kDisabledButtonColor;
        _fahrenheitButtonElevation = kDisabledButtonElevation;
      });
    }
  }

  void _changeUnitSystemToFahrenheit() {
    if (!_fahrenheitButtonStatus) {
      setState(() {
        _celsiusButtonStatus = false;
        _celsiusButtonColor = kDisabledButtonColor;
        _celsiusButtonElevation = kDisabledButtonElevation;
        _fahrenheitButtonStatus = true;
        _fahrenheitButtonColor = kEnabledButtonColor;
        _fahrenheitButtonElevation = kEnabledButtonElevation;
      });
    }
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
                        Icon(
                          WeatherIcons.wi_night_clear,
                          size: 40.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Clear',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '23',
                          style: TextStyle(
                            fontSize: 70,
                          ),
                        ),
                        Icon(
                          WeatherIcons.wi_degrees,
                          size: 70,
                        ),
                        Expanded(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                RaisedButton(
                                  child: Icon(
                                    WeatherIcons.wi_celsius,
                                    size: 30,
                                  ),
                                  color: _celsiusButtonColor,
                                  elevation: _celsiusButtonElevation,
                                  onPressed: _changeUnitSystemToCelsius,
                                ),
                                Container(
                                  height: 2,
                                  width: 70,
                                  color: Colors.grey,
                                ),
                                RaisedButton(
                                  child: Icon(
                                    WeatherIcons.wi_fahrenheit,
                                    size: 30,
                                  ),
                                  color: _fahrenheitButtonColor,
                                  elevation: _fahrenheitButtonElevation,
                                  onPressed: _changeUnitSystemToFahrenheit,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                        Text('DETAILS    '),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        DetailCardWidget(),
                        DetailCardWidget(),
                        DetailCardWidget(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        DetailCardWidget(),
                        DetailCardWidget(),
                        DetailCardWidget(),
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
