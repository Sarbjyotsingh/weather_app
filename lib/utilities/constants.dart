import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Future<bool> kInternetConnectivityChecker() async {
  var connectivityResult = (await Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a mobile network or wifi network.
    return true;
  } else {
    return false;
  }
}

IconData kGetWeatherIcon({@required String iconID}) {
  if (iconID == '11d') {
    return WeatherIcons.wi_day_thunderstorm;
  } else if (iconID == '11n') {
    return WeatherIcons.wi_night_alt_thunderstorm;
  } else if (iconID == '09d') {
    return WeatherIcons.wi_day_rain_mix;
  } else if (iconID == '09n') {
    return WeatherIcons.wi_night_alt_rain_mix;
  } else if (iconID == '10d') {
    return WeatherIcons.wi_day_rain;
  } else if (iconID == '10n') {
    return WeatherIcons.wi_night_alt_rain;
  } else if (iconID == '13d') {
    return WeatherIcons.wi_day_snow;
  } else if (iconID == '13n') {
    return WeatherIcons.wi_night_alt_snow;
  } else if (iconID == '50d') {
    return WeatherIcons.wi_day_fog;
  } else if (iconID == '50n') {
    return WeatherIcons.wi_night_fog;
  } else if (iconID == '03d' || iconID == '02d') {
    return WeatherIcons.wi_day_sunny_overcast;
  } else if (iconID == '03d' || iconID == '02n') {
    return WeatherIcons.wi_night_alt_partly_cloudy;
  } else if (iconID == '04d') {
    return WeatherIcons.wi_day_cloudy;
  } else if (iconID == '04n') {
    return WeatherIcons.wi_night_alt_cloudy;
  } else if (iconID == '01d') {
    return WeatherIcons.wi_day_sunny;
  } else
    return WeatherIcons.wi_night_clear;
}

List<Color> kGradientBackground(
    {int cityID = 800,
    String cityIconID = '00n',
    double currentTemperature = 20}) {
  if (cityIconID[2] == 'd') {
    if (currentTemperature > 25) {
      return kHotDayGradient;
    } else if (cityID >= 200 && cityID <= 232) {
      return kStormGradient;
    } else if (cityID >= 300 && cityID <= 321) {
      return kCloudyGradient;
    } else if (cityID >= 500 && cityID <= 531) {
      return kCloudyGradient;
    } else if (cityID >= 600 && cityID <= 622) {
      return kSleetDayGradient;
    } else if (cityID == 701 ||
        cityID == 711 ||
        cityID == 721 ||
        cityID == 741) {
      return kFogGradient;
    } else if (cityID == 731 || cityID == 751 || cityID == 761) {
      return kSandStormGradient;
    } else if (cityID == 762 || cityID == 771 || cityID == 781) {
      return kTornadoGradient;
    } else
      return kClearSkyGradient;
  } else
    return kClearNightGradient;
}

const kInputTextDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name ',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    borderSide: BorderSide.none,
  ),
);
const kClearNightGradient = [
  Color(0xFF090926),
  Color(0xFF8F5E7D),
];
const kClearSkyGradient = [
  Color(0xFF29b6f6),
  Color(0xFF29b6f6),
];

const kSleetDayGradient = [
  Color(0xFF303030),
  Color(0xFFbdbdbd),
];

const kHotDayGradient = [
  Color(0xFF5A0418),
  Color(0xFFEA5A14),
];

const kStormGradient = [
  Color(0xFF252A5C),
  Color(0xFF976562),
];

const kSandStormGradient = [
  Color(0xFF8A390E),
  Color(0xFFD89045),
];

const kTornadoGradient = [
  Color(0xFF2b1e18),
  Color(0xFF795548),
];

const kFogGradient = [
  Color(0xFF976562),
  Color(0xFF252A5C),
];

const kCloudyGradient = [
  Color(0xFF1F6AB5),
  Color(0xFFb3e5fc),
];

const kClearDayIcon = WeatherIcons.wi_day_sunny;
const kClearNightIcon = WeatherIcons.wi_night_clear;
const kThunderStormDayIcon = WeatherIcons.wi_thunderstorm;
const kThunderStormNightIcon = WeatherIcons.wi_night_alt_thunderstorm;
const kDrizzleDayIcon = WeatherIcons.wi_rain_mix;
const kDrizzleNightIcon = WeatherIcons.wi_night_alt_rain_mix;
const kRainDayIcon = WeatherIcons.wi_day_rain;
const KRainNightIcon = WeatherIcons.wi_night_alt_rain;
const kSnowDayIcon = WeatherIcons.wi_day_snow;
const kNightSnowIcon = WeatherIcons.wi_night_alt_snow;
const kAtmosphereDayIcon = WeatherIcons.wi_day_cloudy_windy;
const kAtmosphereNightIcon = WeatherIcons.wi_night_alt_cloudy_windy;
const kCloudDayIcon = WeatherIcons.wi_day_cloudy_high;
const kNightCloudIcon = WeatherIcons.wi_night_alt_cloudy_high;
const kCloudDayHighIcon = WeatherIcons.wi_day_cloudy;
const kNightCloudHighIcon = WeatherIcons.wi_night_alt_cloudy;

const kDisabledButtonColor = Color(0x66FFFFFF);
const kDisabledButtonElevation = 0.0;
const kEnabledButtonColor = Color(0xFF1e88e5);
const kEnabledButtonElevation = 2.0;
const kTransparentBackgroundColor = Color(0xFF1AFFFFFF);
