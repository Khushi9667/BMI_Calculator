import 'package:bmi_calculator/components/ReuseableCard.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String? bmi;
  final String? result;
  final String? feedback;
  ResultScreen({this.bmi, this.feedback, this.result});
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Color _resultColor = Colors.green;

  @override
  void initState() {
    super.initState();
    _setResultColor();
  }

  void _setResultColor() {
    String? result = widget.result;
    if (result == 'Underweight') {
      _resultColor = Colors.yellow;
    } else if (result == 'Overweight') {
      _resultColor = Colors.orange;
    } else if (result == 'Obese') {
      _resultColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              child: Text(
                'RESULT',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ReuseableCard(
            color: Color(0xff1d1e33),
            myChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    widget.result.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: _resultColor,
                    ),
                  ),
                ),
                Text(
                  widget.bmi.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(widget.feedback.toString(),
                        style: TextStyle(fontSize: 17))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
