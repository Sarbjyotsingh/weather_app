import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DetailCardWidget extends StatefulWidget {
  @override
  _DetailCardWidgetState createState() => _DetailCardWidgetState();
}

class _DetailCardWidgetState extends State<DetailCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        decoration: BoxDecoration(
          color: Color(0x66FFFFFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(WeatherIcons.wi_thermometer),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Feels like',
            ),
            Row(
              children: <Widget>[],
            ),
            Text(
              '22 °',
            ),
          ],
        ),
      ),
    );
  }
}
