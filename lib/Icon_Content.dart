import 'package:flutter/material.dart';
import 'constants.dart';
// ignore: camel_case_types
class my_column extends StatelessWidget {
  my_column({@required this.icon, this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelStyle
        )
      ],
    );
  }
}
