import 'package:flutter/material.dart';

const kGradientBackground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: kSleetDayGradient,
  ),
);
const kClearNightGradient = [
  Color(0xFF090926),
  Color(0xFF8F5E7D),
];
const kClearDayGradient = [
  Color(0xFF1F6AB5),
  Color(0xFFb3e5fc),
];

const kSleetDayGradient = [
  Color(0xFF303030),
  Color(0xFFbdbdbd),
];
