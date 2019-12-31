import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/location_info.dart';

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
    if (!await LocationInfo().getUserLocation()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return CityScreen();
      }));
    } else {
      LocationInfo locationInfo = new LocationInfo();
      await locationInfo.getUserLocationData();
      print(locationInfo);
      print(locationInfo.longitude);
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
