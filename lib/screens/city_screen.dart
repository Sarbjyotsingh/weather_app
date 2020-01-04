import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

//Todo: On returning (By button of return without entering city)to Location Screen use Navigator Push Replacement
class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
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
                  onPressed: () => Navigator.of(context).pop(true),
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
    var route = ModalRoute.of(context).settings.name;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        decoration: kGradientBackground,
        child: SafeArea(
          child: Text('Text $route'),
        ),
      ),
    );
  }
}
