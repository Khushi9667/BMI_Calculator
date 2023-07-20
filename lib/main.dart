import 'package:bmi_calculator/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI CALCULATOR",
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff0a0321),
          hintColor: Colors.pink,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(
              elevation: 0, centerTitle: true, color: Color(0xff0a0321))),
      home: Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
