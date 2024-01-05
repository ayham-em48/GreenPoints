import 'package:flutter/material.dart';
import 'package:green_points/Screens/Login.dart';
import 'Style/Style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: colorCustom,
        textTheme: TextTheme(
          body1: Body1Style
        )
      ),
      home: Login(),
    );
  }
}
