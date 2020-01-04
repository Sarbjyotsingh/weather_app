import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/forecast_screen.dart';
import 'package:weather_app/services/formatted_date_time.dart';
import 'package:weather_app/services/location_info.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/widgets/detail_card_widget.dart';

// Todo: refactor all code
//Todo: exit popup on City Screen if no back screen

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({@required this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _currentDateTime;
  IconData _weatherIcon;
  String _weatherStatus;
  String _cityName;
  int _temperature;
  int _temperatureFeelLike;
  double _wind;
  int _humidity;
  int _pressure;
  int _visibility;
  int _cloudiness;
  bool _celsiusButtonStatus;
  bool _fahrenheitButtonStatus;
  Color _celsiusButtonColor;
  Color _fahrenheitButtonColor;
  double _celsiusButtonElevation;
  double _fahrenheitButtonElevation;

  Future<bool> _onWillPop() async {
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
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  void _getCurrentDateTimeString() {
    String timeString =
        FormattedDateTime(dateTime: DateTime.now()).getFormattedDateTime();
    setState(() {
      _currentDateTime = timeString;
    });
  }

  void _getUserLocationData() async {
    // getting user location
    if (await LocationInfo().getUserLocationAndGPS()) {
      LocationInfo locationInfo = new LocationInfo();
      await locationInfo.getUserLocationData();
      //getting weather data on basis of location
      Weather weather = new Weather();
      dynamic weatherData = await weather.getLocationWeatherCurrentData(
          longitude: locationInfo.longitude, latitude: locationInfo.latitude);
      _updateUI(weatherData);
    }
  }

  void _updateUI(dynamic weatherData) {
    setState(() {
      try {
        _weatherIcon = kWetWeatherIcon();
        _weatherStatus = weatherData['weather'][0]['main'];
        _cityName = weatherData['name'];
        _temperature = weatherData['main']['temp'].toInt();
        _temperatureFeelLike = weatherData['main']['feels_like'].toInt();
        _wind = weatherData['wind']['speed'].toDouble();
        _humidity = weatherData['main']['humidity'].toInt();
        _pressure = weatherData['main']['pressure'].toInt();
        _visibility = weatherData['visibility'].toInt();
        _cloudiness = weatherData['clouds']['all'].toInt();
      } catch (e) {
        _weatherIcon = WeatherIcons.wi_na;
        _cityName = '';
        _weatherStatus = 'ERROR';
        _temperature = null;
        _temperatureFeelLike = null;
        _wind = null;
        _humidity = null;
        _pressure = null;
        _visibility = null;
        _cloudiness = null;
        print(e);
      }
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
        _temperature = ((_temperature - 32) * 5 ~/ 9);
        _temperatureFeelLike = ((_temperatureFeelLike - 32) * 5 ~/ 9);
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
        _temperature = ((_temperature * 9) ~/ 5) + 32;
        _temperatureFeelLike = ((_temperatureFeelLike * 9) ~/ 5) + 32;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentDateTimeString();
    Timer.periodic(
        Duration(seconds: 1), (Timer t) => _getCurrentDateTimeString());
    _celsiusButtonStatus = true;
    _celsiusButtonColor = kEnabledButtonColor;
    _celsiusButtonElevation = kEnabledButtonElevation;
    _fahrenheitButtonStatus = false;
    _fahrenheitButtonColor = kDisabledButtonColor;
    _fahrenheitButtonElevation = kDisabledButtonElevation;
    _updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                            //Todo: Test this button running or not after completion of city screen
                            child: IconButton(
                              icon: Icon(Icons.gps_fixed),
                              color: Colors.white,
                              iconSize: 33,
                              onPressed: _getUserLocationData,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Center(
                              child: Text(
                                _cityName,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return CityScreen();
                                  }),
                                );
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
                            _weatherIcon,
                            size: 40.0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _weatherStatus,
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '${_temperature.toInt()}',
                            style: TextStyle(
                              fontSize: 70,
                            ),
                          ),
                          Icon(
                            WeatherIcons.wi_degrees,
                            size: 70,
                          ),
                          //Todo: refactor 2 button
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
                  child: RaisedButton(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesome.line_chart),
                          Text('Forecast'),
                        ],
                      ),
                    ),
                    color: kTransparentBackgroundColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ForecastScreen();
                          },
                        ),
                      );
                    },
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
                          Expanded(
                            child: DetailCardWidget(
                              cardIconData: WeatherIcons.wi_thermometer,
                              cardText: 'Feels like',
                              cardValue: '${_temperatureFeelLike.toInt()} °',
                            ),
                          ),
                          Expanded(
                            child: DetailCardWidget(
                              cardIconData: WeatherIcons.wi_strong_wind,
                              cardText: 'Wind',
                              cardValue: '$_wind Km/h',
                            ),
                          ),
                          Expanded(
                            child: DetailCardWidget(
                              cardIconData: WeatherIcons.wi_humidity,
                              cardText: 'Humidity',
                              cardValue: '$_humidity %',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: DetailCardWidget(
                              cardIconData: WeatherIcons.wi_barometer,
                              cardText: 'Pressure',
                              cardValue: '$_pressure in',
                            ),
                          ),
                          Expanded(
                            child: DetailCardWidget(
                              cardIconData: MaterialIcons.remove_red_eye,
                              cardText: 'Visibility',
                              cardValue: '$_visibility',
                            ),
                          ),
                          Expanded(
                            child: DetailCardWidget(
                              cardIconData: WeatherIcons.wi_cloudy,
                              cardText: 'Cloudiness',
                              cardValue: '$_cloudiness %',
                            ),
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
      ),
    );
  }
}
