import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:open_settings/open_settings.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location_info.dart';
import 'package:weather_app/services/weather.dart';

import '../utilities/constants.dart';

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
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  void getUserLocationData() async {
    //Checking Internet Connection
    if (await kInternetConnectivityChecker() == true) {
      // getting user location
      if (!await LocationInfo().getUserLocationAndGPS()) {
        Navigator.pushReplacementNamed(context, '/CityScreen');
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
    } else {
      showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text(' No Internet '),
          content: new Text(
              'This app requires Internet connection. Do you want to continue?'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () =>
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              child: new Text('cancel'),
            ),
            new FlatButton(
              onPressed: () async {
                if (await kInternetConnectivityChecker() == false) {
                  OpenSettings.openWIFISetting();
                }
                Navigator.pop(context);
                getUserLocationData();
              },
              child: new Text('ok'),
            ),
          ],
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
