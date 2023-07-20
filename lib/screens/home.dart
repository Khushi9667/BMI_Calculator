import 'package:bmi_calculator/components/IconWithLabel.dart';
import 'package:bmi_calculator/methods/CallBMI.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/ReuseableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/RoundedBTN.dart';
import 'package:bmi_calculator/screens/resultScreen.dart';

enum GenderSelection { Male, Female }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inActiveColor = Color(0xff1d1e33);
  final activeColor = Color(0x11d1e33);
  GenderSelection? selection;
  int _height = 150;
  int _weight = 60;
  int _age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                    color: selection == GenderSelection.Male
                        ? activeColor
                        : inActiveColor,
                    myChild: IconWithLabel(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onpress: () {
                      setState(() {
                        selection = GenderSelection.Male;
                      });
                    },
                  ),
                  ReuseableCard(
                    color: selection == GenderSelection.Male
                        ? inActiveColor
                        : activeColor,
                    myChild: IconWithLabel(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onpress: () {
                      setState(() {
                        selection = GenderSelection.Female;
                      });
                    },
                  ),
                ],
              ),
            ),
            ReuseableCard(
              color: Color(0xff1d1e33),
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'HEIGHT',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        child: Text(
                          _height.toString(),
                          style: TextStyle(
                              fontSize: 47, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          'cm',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x15eb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue.toInt().round();
                          });
                        },
                        max: 220,
                        min: 120,
                        value: _height.toDouble(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                    color: Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('WEIGHT'),
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Container(
                              child: Text(_weight.toString(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              child: Text(
                                'kg',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedBTN(
                                color: Color(0xff0A0E21),
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    _weight++;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            RoundedBTN(
                                color: Color(0xff0A0E21),
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    _weight--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ReuseableCard(
                    color: Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('AGE'),
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Container(
                              child: Text(_age.toString(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              child: Text(
                                'yr',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedBTN(
                                color: Color(0xff0A0E21),
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    _age++;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            RoundedBTN(
                                color: Color(0xff0A0E21),
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    _age--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  CalculateBMI calculateBMI =
                      CalculateBMI(height: _height, weight: _weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ResultScreen(
                                bmi: calculateBMI.calculateBMI(),
                                result: calculateBMI.getResult(),
                                feedback: calculateBMI.feedback(),
                              )));
                },
                child: Text('CALCULATE'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).hintColor,
                  minimumSize: Size(double.infinity, 50),
                )),
          ]),
        ));
  }
}
