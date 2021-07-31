import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'My_Widget.dart';
import 'Icon_Content.dart';
import 'constants.dart';
import 'results.dart';
import 'calculator_brain.dart';

enum gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedgender;
  int height = 180;
  int weight = 40;
  int age = 18;
  /*int malecardcolor = Inactivecardcolour;
  int femalecardcolor = Inactivecardcolour;
  void updatecolor(gender g)
  {
    if (g==gender.male)
      {
        if(malecardcolor==Inactivecardcolour)
          {
            malecardcolor = colour;
            femalecardcolor =Inactivecardcolour;
          }
        else
          {
            malecardcolor = Inactivecardcolour;
            femalecardcolor =colour;
          }
      }
      else if (g==gender.female)
      {
        if(femalecardcolor==Inactivecardcolour)
        {
          femalecardcolor = colour;
          malecardcolor =Inactivecardcolour;
        }
        else
        {
          femalecardcolor = Inactivecardcolour;
        }
      }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: my_container(
                    Onpress: () {
                      selectedgender = gender.male;
                    },
                    colour: selectedgender == gender.male
                        ? Color(kColour)
                        : Color(kInactivecardcolour),
                    cardchild: my_column(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: my_container(
                    Onpress: () {
                      selectedgender = gender.female;
                    },
                    colour: selectedgender == gender.female
                        ? Color(kColour)
                        : Color(kInactivecardcolour),
                    cardchild: my_column(
                      text: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: my_container(
                    colour: Color(kColour),
                    cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'HEIGHT',
                              style: kLabelStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(height.toString(), style: kNum),
                              Text(
                                'cm',
                                style: kLabelStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xffeb1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                              activeTrackColor: Colors.white,
                              overlayColor: Color(0x29eb1555),
                              inactiveTrackColor: Color(0xff8d8e98),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newvalue) {
                                setState(() {
                                  height = newvalue.round();
                                });
                              },
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: my_container(
                    colour: Color(kColour),
                    cardchild: Column(
                      children: [
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNum,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundiconbutton(
                              child: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            roundiconbutton(
                              child: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: my_container(
                    colour: Color(kColour),
                    cardchild: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNum,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundiconbutton(
                              child: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            roundiconbutton(
                              child: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculator_brain calc =
                  calculator_brain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiresult: calc.calculate(),
                    resulttext: calc.getresult(),
                    interpretation: calc.getinterpratation(),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              color: Color(kBottomContainerColor),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                  child: Text(
                'CALCULATE',
                style: kstyle,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class roundiconbutton extends StatelessWidget {
  roundiconbutton({@required this.child, @required this.onpress});
  final IconData child;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: onpress,
      child: Icon(child),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
