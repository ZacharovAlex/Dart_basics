import 'package:flutter/material.dart';
import 'package:skillboxdemo/extension_validation.dart';

import '../commonClasses.dart';
import 'logic.dart';


class NumberFourView extends StatefulWidget {
  final String title;

  const NumberFourView({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberFourView> createState() => _NumberFourViewState();
}

class _NumberFourViewState extends State<NumberFourView> {
  final _controllerString = TextEditingController();
  var result = <String, int>{};
  bool isValidate = false;

  void findWordsStart() {
    result = FindWords(_controllerString.text.split(','))
        .findWords(); //TODO test маша,петя,маша,валя,миша,петя,петя
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
                  ElevatedButton(onPressed: findWordsStart, child: const Text('Посчитать вхождения')),
                  ElevatedButton(onPressed: clear, child: const Text('Очистить')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MyFormField(
                isValid: isValidate,
                validation: validateText,
                controller: _controllerString,
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
