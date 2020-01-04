import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location_info.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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

  void getUserLocationData() async {
    // getting user location
    if (!await LocationInfo().getUserLocationAndGPS()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CityScreen();
          },
        ),
      );
    } else {
      LocationInfo locationInfo = new LocationInfo();
      await locationInfo.getUserLocationData();
      //getting weather data on basis of location
      Weather weather = new Weather();
      dynamic weatherData = await weather.getLocationWeatherCurrentData(
          longitude: locationInfo.longitude, latitude: locationInfo.latitude);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(
              weatherData: weatherData,
            );
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getUserLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        child: Center(
          child: SpinKitRing(
            color: Colors.white,
            size: 70.0,
          ),
        ),
      ),
    );
  }
}
