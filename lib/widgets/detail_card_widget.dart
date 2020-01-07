import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class DetailCardWidget extends StatefulWidget {
  final IconData cardIconData;
  final String cardText;
  final String cardValue;

  DetailCardWidget(
      {@required this.cardIconData,
      @required this.cardText,
      @required this.cardValue});

  @override
  _DetailCardWidgetState createState() => _DetailCardWidgetState();
}

class _DetailCardWidgetState extends State<DetailCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
        color: kTransparentBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            widget.cardIconData,
            color: kClearNightGradient[0],
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            widget.cardText,
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            children: <Widget>[],
          ),
          Text(
            widget.cardValue,
          ),
        ],
      ),
    );
  }
}
