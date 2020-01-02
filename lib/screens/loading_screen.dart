import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location_info.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getUserLocationData();
  }

  void getUserLocationData() async {
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
