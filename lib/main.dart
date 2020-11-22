import 'package:b_finder/Screens/details.dart';
import 'package:b_finder/Screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Details(),
     debugShowCheckedModeBanner: false,
     
 
    );
  }
}
