import 'package:flutter/material.dart';
import 'dart:math';
// ignore: camel_case_types
class calculator_brain{
  calculator_brain({this.weight,this.height});
  final int weight;
  final int height;
  double _bmi;
  String calculate()
  {
    _bmi = weight / pow(height / 100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getresult(){
    if(_bmi >= 25){
      return 'OVERWEIGHT';
    }
    else if(_bmi > 18.5) {
      return 'NORMAL';
    }
    else{
      return 'UNDERWEIGHT';
    }
  }
  String getinterpratation()
  {
    if(_bmi >= 25){
      return 'YOU HAVE A HIGHER THAN NORMAL BODY WEIGHT. TRY TO EXERCISE MORE.';
    }
    else if(_bmi > 18.5) {
      return 'YOU HAVE A NORMAL BODY WEIGHT. GOOD JOB.';
    }
    else{
      return 'YOU HAVE A LOWER THAN NORMAL BODY WEIGHT.YOU CAN EAT A BIT MORE.';
    }
  }
}