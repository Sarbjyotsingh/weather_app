import 'dart:io';

import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  final List<Color> gradientBackgroundColor;
  CityScreen({this.gradientBackgroundColor = kClearNightGradient});
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
// only show exit popup when Routing from loading screen and press back button
  Future<bool> _onWillPop() async {
    var route = ModalRoute.of(context).settings.name;
    if (route != null) {
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
                  onPressed: () => exit(0),
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    } else {
      Navigator.of(context).pop(true);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            currentFocus.unfocus();
          },
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: widget.gradientBackgroundColor,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      onPressed: () {
                        if (ModalRoute.of(context).settings.name != null) {
                          _onWillPop();
                        } else
                          Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 33.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: kInputTextDecoration,
                      onChanged: (value) {
                        cityName = value;
                      },
                      onSubmitted: (String value) {
                        Navigator.pop(context, value);
                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: FlatButton(
                      child: Text(
                        'Get Weather',
                      ),
                      color: kEnabledButtonColor,
                      onPressed: () {
                        Navigator.pop(context, cityName);
                      },
                      padding: EdgeInsets.symmetric(horizontal: 35),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
