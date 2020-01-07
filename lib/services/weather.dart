import 'package:flutter/cupertino.dart';
import 'package:weather_app/services/networking.dart';

class Weather {
  final _apiKey = '&units=metric&appid=9d868bd4b3091ce45569039efaf4191f';
  final _apiURL = 'https://api.openweathermap.org/data/2.5/';

  Future getLocationWeatherCurrentData(
      {@required double longitude, @required double latitude}) async {
    NetworkHelper networkHelper = new NetworkHelper(
        url: '${_apiURL}weather?lat=$latitude&lon=$longitude$_apiKey');
    return await networkHelper.getResponseData();
  }

  // Todo: get stream of data by city name only

// For stream of data: dio package (weather forecast)
//  Future<dynamic> getLocationWeatherForecastData(
//      {@required double longitude, @required double latitude}) async {
//    NetworkHelper networkHelper = new NetworkHelper(
//        url: '${_apiURL}forecast?lat=$latitude&lon=$longitude$_apiKey');
//    return await networkHelper.getResponseData();
//  }

  Future getCityWeatherCurrentData({@required String cityName}) async {
    NetworkHelper networkHelper =
        new NetworkHelper(url: '${_apiURL}weather?q=$cityName$_apiKey');
    return await networkHelper.getResponseData();
  }
}
