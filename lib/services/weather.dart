import 'package:flutter/cupertino.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/utilities/constants.dart';

//Todo: add gradient coding here as it is related to weather

class Weather {
  Future getLocationWeatherCurrentData(
      {@required double longitude, @required double latitude}) async {
    NetworkHelper networkHelper = new NetworkHelper(
        url: '${kApiURL}weather?lat=$latitude&lon=$longitude$kApiKey');
    return await networkHelper.getResponseData();
  }

  Future getLocationWeatherForecastData(
      {@required double longitude, @required double latitude}) async {
    NetworkHelper networkHelper = new NetworkHelper(
        url: '${kApiURL}forecast?lat=$latitude&lon=$longitude$kApiKey');
    return await networkHelper.getResponseData();
  }
}
