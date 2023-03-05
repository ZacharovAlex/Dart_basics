import 'package:flutter/material.dart';
import 'package:skillboxdemo/extension_validation.dart';
import 'package:skillboxdemo/numberSeven/extension_on_num.dart';

import '../commonClasses.dart';
import 'logic.dart';

class NumberSevenView extends StatefulWidget {
  final String title;

  const NumberSevenView({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberSevenView> createState() => _NumberSevenViewState();
}

class _NumberSevenViewState extends State<NumberSevenView> {
  final _controllerA = TextEditingController();
  final _controllerN = TextEditingController();
  bool isValidateA = false;
  bool isValidateN = false;
  double a = 0;
  double n = 1;
  String resultFast = '';
  String resultSlow = '';
  int speedFast = 0;
  int speedSlow = 0;

  void validateA(String s) {
    isValidateA = s.isFloatNotNegative();
    setState(() {});
  }

  void validateN(String s) {
    isValidateN = s.isFloatNotNegative();
    setState(() {});
  }

  void rootFast() {
    a = double.tryParse(_controllerA.text) ?? 0.0;
    n = double.tryParse(_controllerN.text) ?? 0.0;
    var time = DateTime.now().toUtc();
    resultFast = a.rootN(n, 6).toString();
    speedFast = DateTime.now().toUtc().difference(time).inMilliseconds;
    setState(() {});
  }

  void rootSlow() {
    a = double.tryParse(_controllerA.text) ?? 0.0;
    n = double.tryParse(_controllerN.text) ?? 0.0;
    var time = DateTime.now().toUtc();
    resultSlow = Calc(a, n, 6).stepenSlow().toString();
    speedSlow = DateTime.now().toUtc().difference(time).inMilliseconds;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: MyFormField(
                        isValid: isValidateA,
                        validation: validateA,
                        controller: _controllerA,
                        digitQuantity: 6,
                        hintText: 'Введите число',
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: MyFormField(
                        isValid: isValidateN,
                        validation: validateN,
                        controller: _controllerN,
                        digitQuantity: 5,
                        hintText: 'Введите степень корня',
                      )),
                ],
              ),
              ElevatedButton(
                  onPressed: (isValidateA && isValidateN) ? rootFast : null,
                  child: const Text('Вычислить корень с функцией бинарного возведение в степень')),
              ElevatedButton(
                  onPressed: (isValidateA && isValidateN) ? rootSlow : null,
                  child: const Text('Вычислить корень (возведение в степень перемножением)')),
              const SizedBox(
                height: 10,
              ),
              resultFast != ''
                  ? Column(
                      children: [
                        Text('Корень $n степени из $a : '),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              resultFast,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        Text('Время выполения(бинарное умножение) : $speedFast ms '),
                      ],
                    )
                  : const SizedBox(),
              resultSlow != ''
                  ? Column(
                      children: [
                        Text('Корень $n степени из $a : '),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              resultSlow,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        Text('Время выполения(обычное перемножение) : $speedSlow ms '),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
