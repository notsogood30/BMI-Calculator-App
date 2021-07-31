import 'package:flutter/material.dart';
// ignore: camel_case_types
class my_container extends StatelessWidget {
  //stateless widgets are immutable so we use final keyword as they can be given once
  my_container(
      {@required this.colour,
        this.cardchild,this.Onpress}); // const and final keywords are immutable
  final Color colour;
  final Widget cardchild;
  final Function Onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: colour),
      ),
    );
  }
}