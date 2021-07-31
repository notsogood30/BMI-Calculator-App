import 'package:flutter/material.dart';
import 'InputPage.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xff11163A),
            scaffoldBackgroundColor: Color(0xff11163A),
            // ignore: deprecated_member_use
            textTheme: TextTheme(body1: TextStyle(color: Color(0xFFFFFFFF)))
        ),
      home: InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}



