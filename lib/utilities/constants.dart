import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

const kGradientBackground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: kClearNightGradient,
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

IconData kWetWeatherIcon() {
  return kDrizzleNightIcon;
}

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

//Todo: Add when no city found.
AlertDialog kNoCityFoundAlertDialog = AlertDialog(
  title: Text('Error 404'),
  content: Text('No City Found'),
  actions: <Widget>[
    FlatButton(
      child: Text('OK'),
      onPressed: null,
    ),
  ],
);
