import 'package:flutter/material.dart';
import 'package:gemography_task/models/constants.dart';
import 'package:gemography_task/screens/home%20page%20screen/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: mPrimaryColor,
        scaffoldBackgroundColor: mScaffoldBackGroundColor,
      ),
      home: HomePage(),
    );
  }
}
