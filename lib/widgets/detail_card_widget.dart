import 'package:flutter/material.dart';

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
            Icon(widget.cardIconData),
            SizedBox(
              height: 12.0,
            ),
            Text(
              widget.cardText,
            ),
            Row(
              children: <Widget>[],
            ),
            Text(
              widget.cardValue,
            ),
          ],
        ),
      ),
    );
  }
}
