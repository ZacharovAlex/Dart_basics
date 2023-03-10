
import 'package:flutter/material.dart';
import 'package:skillboxdemo/extension_validation.dart';
import '../commonClasses.dart';
import '../skillbox_work2_logic/logic_number_nine.dart';

class NumberNineView extends StatefulWidget {
  final String title;

  const NumberNineView({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberNineView> createState() => _NumberNineViewState();
}

class _NumberNineViewState extends State<NumberNineView> {
  final _myControllerFormula = TextEditingController();
  final _myControllerFrom = TextEditingController();
  final _myControllerTo = TextEditingController();
  final _myControllerAccuracy = TextEditingController();
  final integralRimana = Riman();
  var result = RimanAnswer();
  bool isValidFormula = false;
  bool isValidDiapazonFrom = false;
  bool isValidDiapazonTo = false;
  bool isValidAccuracy = false;

  void validateFrom(String s) {
    isValidDiapazonFrom = s.isFloat();
    setState(() {});
  }

  void validateTo(String s) {
    isValidDiapazonTo = s.isFloat();
    setState(() {});
  }

  void validateAccuracy(String s) {
    isValidAccuracy = s.isNumber();
    setState(() {});
  }

  void validateFormula(String s) {
    isValidFormula = s.isChar();
    setState(() {});
  }

  void parseString() {
    result = integralRimana.resultRiman(_myControllerFormula.text, double.parse(_myControllerFrom.text),
        double.parse(_myControllerTo.text), int.parse(_myControllerAccuracy.text),2);

    setState(() {});
  }

  @override
  void dispose() {
    _myControllerFormula.dispose();
    _myControllerFrom.dispose();
    _myControllerTo.dispose();
    _myControllerAccuracy.dispose();
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: MyFormField(
                  controller: _myControllerFormula,
                  hintText: 'Enter Formula',
                  digitQuantity: 50,
                  maxLines: 1,
                  isValid: isValidFormula,
                  validation: validateFormula,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('От'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: MyFormField(
                      controller: _myControllerFrom,
                      hintText: 'Enter From',
                      digitQuantity: 50,
                      maxLines: 1,
                      isValid: isValidDiapazonFrom,
                      validation: validateFrom,
                    ),
                  ),
                  const Text('До'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: MyFormField(
                      controller: _myControllerTo,
                      hintText: 'Enter To',
                      digitQuantity: 50,
                      maxLines: 1,
                      isValid: isValidDiapazonTo,
                      validation: validateTo,
                    ),
                  ),
                  Column(
                    children: [
                      const Text('Количество разбиений'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: MyFormField(
                          controller: _myControllerAccuracy,
                          hintText: 'Enter Accuracy',
                          digitQuantity: 50,
                          maxLines: 1,
                          isValid: isValidAccuracy,
                          validation: validateAccuracy,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed:
                          (isValidDiapazonFrom && isValidDiapazonTo && isValidAccuracy) ? parseString : null,
                      child: const Text('Посчитать интеграл')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              result.answer != ''
                  ? Text(
                      'Интеграл от ${_myControllerFormula.text} : ${result.answer} с точностью в ${result.accuracy}')
                  : const SizedBox(),
              (result.badPointsDiapazon != null && result.badPointsDiapazon!.isNotEmpty)
                  ? Text(
                      'Нет значений функции в диапазонах : ${result.badPointsDiapazon!.first} - ${result.badPointsDiapazon!.last} ')
                  : const SizedBox(),
              (result.infinitePoints != null && result.infinitePoints!.isNotEmpty)
                  ? Text('Функция уходит в беесконечность в значениях  : ${result.infinitePoints!} ')
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
