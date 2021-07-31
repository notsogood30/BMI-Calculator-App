import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'My_Widget.dart';
import 'InputPage.dart';
import 'calculator_brain.dart';
class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiresult,@required this.interpretation,@required this.resulttext});
  final String bmiresult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
            'YOUR BMI',
            style: kTitle,
          ),
              )),
          Expanded(
              flex: 5,
              child: my_container(
                colour: Color(kColour),
                cardchild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        resulttext.toUpperCase(),
                        style: kstyletext,
                      ),
                    ),
                    Center(child: Text(bmiresult,style: kBMI,)),
                    Center(child: Text(interpretation,style: kBodyStyle,textAlign: TextAlign.center,),),
                  ],
                ),
              )),
              Expanded(child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  margin: EdgeInsets.only(top: 10.0),
                  color: Color(kBottomContainerColor),
                  width: double.infinity,
                  height: kBottomContainerHeight,
                  child: Center(child: Text('RE - CALCULATE',style: kstyle,)),
                ),
              ),)
        ],
      ),
    );
  }
}
