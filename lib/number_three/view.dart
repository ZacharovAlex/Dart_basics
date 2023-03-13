import 'dart:core';

import 'package:flutter/material.dart';
import 'package:skillboxdemo/extension_validation.dart';

import '../commonClasses.dart';
import 'package:skillbox_dart_basics/skillbox_dart_basics.dart';


class NumberThreeView extends StatefulWidget {
  final String title;

  const NumberThreeView({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberThreeView> createState() => _NumberThreeViewState();
}

class _NumberThreeViewState extends State<NumberThreeView> {
  final _controllerString = TextEditingController();
  var num = [];
  bool isValidate = false;

  void parseString() {
    num = ParseStringForNum().parsing(_controllerString.text);
    setState(() {});
  }

  validateText(String s) {
    isValidate = s.isChar();
    setState(() {});
  }

  void clear() {
    _controllerString.clear();
    setState(() {});
  }

  @override
  void dispose() {
    _controllerString.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: parseString, child: const Text('Найти числа')),
                  ElevatedButton(onPressed: clear, child: const Text('Очистить')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MyFormField(
                isValid: isValidate,
                validation: validateText,
                // regex: RegExp(r'.'),
                controller: _controllerString,
                hintText: 'Input String',
                digitQuantity: 3000,
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Числа в строке : $num')
            ],
          ),
        ),
      ),
    );
  }
}
