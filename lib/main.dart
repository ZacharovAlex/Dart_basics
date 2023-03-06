import 'dart:core';

import 'package:flutter/material.dart';

import 'number_one/view.dart';
import 'number_three/view.dart';
import 'number_two/view.dart';
import 'number_four/view.dart';
import 'number_five/view.dart';
import 'number_six/view.dart';
import 'number_seven/view.dart';
import 'number_eight/view.dart';
import 'number_nine/view_nine.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillBox практические работы',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
     PageView(
       controller: _controller,
       children: const [
         NumberOneView(title: 'SkillBox 2.6 Практика задание 1'),
         NumberTwoView(title: 'SkillBox 2.6 Практика задание 2'),
         NumberThreeView(title: 'SkillBox 2.6 Практика задание 3'),
         NumberFourView(title: 'SkillBox 2.6 Практика задание 4'),
         NumberFiveView(title: 'SkillBox 2.6 Практика задание 5'),
         NumberSixView(title: 'SkillBox 2.6 Практика задание 6'),
         NumberSevenView(title: 'SkillBox 2.6 Практика задание 7'),
         NumberEightView(title: 'SkillBox 2.6 Практика задание 8'),
         NumberNineView(title: 'SkillBox 2.6 Практика задание 9'),


       ],
     )

    );
  }
}

