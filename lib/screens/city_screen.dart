import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:open_settings/open_settings.dart';
import 'package:weather_app/services/weather.dart';

import '../utilities/constants.dart';
import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  final List<Color> gradientBackgroundColor;
  CityScreen({this.gradientBackgroundColor = kClearNightGradient});
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  bool _pressAttention;
// only show exit popup when Routing from loading screen and press back button
  Future<bool> _onWillPop() async {
    var route = ModalRoute.of(context).settings.name;
    if (route != null) {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () => exit(0),
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    } else {
      Navigator.of(context).pop(true);
      return false;
    }
  }

  void _getUserCityWeatherData() async {
    if (cityName != null) {
      //Checking Internet Connection
      if (await kInternetConnectivityChecker() == true) {
        //getting weather data on basis of City Name
        setState(() {
          _pressAttention = !_pressAttention;
        });
        Weather weather = new Weather();
        dynamic weatherData =
            await weather.getCityWeatherCurrentData(cityName: cityName);

        if (weatherData == 404) {
          _cityNotFoundPopUp();
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return LocationScreen(
                weatherData: weatherData,
              );
            }),
          );
        }
        setState(() {
          _pressAttention = !_pressAttention;
        });
      } else {
        _noInternetConnectionPopup();
      }
    }
  }

  void _cityNotFoundPopUp() {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Error 404'),
        content: new Text('City Not Found'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.pop(context);
              //Todo: make take field == null or ''
            },
            child: new Text('OK'),
          ),
        ],
      ),
    );
  }

  void _noInternetConnectionPopup() {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(' No Internet '),
        content: new Text(
            'This app requires Internet connection. Do you want to continue?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: new Text('cancel'),
          ),
          new FlatButton(
            onPressed: () async {
              if (await kInternetConnectivityChecker() == false) {
                OpenSettings.openWIFISetting();
              }
              Navigator.pop(context);
            },
            child: new Text('ok'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pressAttention = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            currentFocus.unfocus();
          },
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: widget.gradientBackgroundColor,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: kInputTextDecoration,
                      onChanged: (value) {
                        cityName = value;
                      },
                      onSubmitted: (String value) {
                        _getUserCityWeatherData();
                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).copyWith().size.width / 2,
                    child: RaisedButton(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _pressAttention
                                ? <Widget>[
                                    Text('Get Weather'),
                                  ]
                                : <Widget>[
                                    SpinKitWave(
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ],
                          ),
                        ),
                        color: kEnabledButtonColor,
                        onPressed: () {
                          _getUserCityWeatherData();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
