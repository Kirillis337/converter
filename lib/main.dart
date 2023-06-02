import 'package:converter/mass.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'temperature.dart';
import 'speed.dart';
import 'area.dart';
import 'length.dart';
// ignore_for_file: prefer_const_constructors

void main() =>  runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primaryColor: Color(0xFF52C9DC)),
      initialRoute:   '/',
      routes: {
        '/': (context)=>HomePage(),
        '/temperature': (context)=>TemperaturePage(),
        '/mass':(context)=>MassPage(),
        '/speed':(context)=>SpeedPage(),
        '/area':(context)=>AreaPage(),
        '/length':(context)=>LengthPage(),
      },
    );
  }
}
