import 'package:flutter/material.dart';
import 'package:skillboxdemo/extension_validation.dart';

import '../commonClasses.dart';
import 'logic.dart';


class NumberFiveView extends StatefulWidget {
  final String title;

  const NumberFiveView({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberFiveView> createState() => _NumberFiveViewState();
}

class _NumberFiveViewState extends State<NumberFiveView> {
  final _controllerWordString = TextEditingController();
  var result = <int>{};
  bool isValidate = false;
  void findWordsStart() {
   result = FindNumbersWords(_controllerWordString.text.split(',')).findNumbers();  //TODO one, two, zero, zero
    setState(() {});
  }
  validateText(String s) {
    isValidate = s.isChar();
    setState(() {});
  }
  void clear() {
    _controllerWordString.clear();
    setState(() {});
  }
  @override
  void dispose() {
    _controllerWordString.dispose();
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
                  ElevatedButton(onPressed: findWordsStart, child: const Text('Найти уникальные числа')),
                  ElevatedButton(onPressed: clear, child: const Text('Очистить')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MyFormField(
                isValid: isValidate,
                validation: validateText,
                controller: _controllerWordString,
                hintText: 'Input list of strings (split ",")',
                digitQuantity: 3000,
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text('$result')
            ],
          ),
        ),
      ),
    );
  }
}
