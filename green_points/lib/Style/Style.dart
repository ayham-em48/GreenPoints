import 'package:flutter/material.dart';

const String FontNameDefault = 'Ubuntu';

const Body1Style = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 26.0,
  color: Colors.black,
);

Map<int, Color> color =
{
50:Color.fromRGBO(23,111,23, .1),
100:Color.fromRGBO(23,111,23, .2),
200:Color.fromRGBO(23,111,23, .3),
300:Color.fromRGBO(23,111,23, .4),
400:Color.fromRGBO(23,111,23, .5),
500:Color.fromRGBO(23,111,23, .6),
600:Color.fromRGBO(23,111,23, .7),
700:Color.fromRGBO(23,111,23, .8),
800:Color.fromRGBO(23,111,23, .9),
900:Color.fromRGBO(23,111,23, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF176F17, color);