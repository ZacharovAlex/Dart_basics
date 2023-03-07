import 'package:flutter/material.dart';
import 'package:skillboxdemo/number_one/utils.dart';

import 'package:skillboxdemo/extension_validation.dart';
import '../commonClasses.dart';

class NumberOneView extends StatefulWidget {
  const NumberOneView({super.key, required this.title});

  final String title;

  @override
  State<NumberOneView> createState() => _NumberOneViewState();
}

class _NumberOneViewState extends State<NumberOneView> {
  final _myControllerOne = TextEditingController();
  List<int> listInt = [];
  int? leastCommonMultiple = 0;
  int? greatestCommonDivisor = 0;
  List<int> simpleDelimeters = [];
  bool validateNumber = false;

  void incrementField() {
    final inputText = int.tryParse(_myControllerOne.text);
    listInt.add((inputText ?? 0));
    _myControllerOne.clear();
    simpleDelimeters.clear();
    setState(() {});
  }

  validate(String s) {
    validateNumber = s.isNumber();
    setState(() {});
  }

  void decrementField() {
    listInt.removeLast();
    simpleDelimeters.clear();
    setState(() {});
  }

  void resultNokNod() {
    var result = NodNok(listInt).gcdList();
    leastCommonMultiple = result.leastCommonMultiple;
    greatestCommonDivisor = result.greatestCommonDivisor;
    setState(() {});
  }

  void simpleDelimeterLastNum() {
    var result = NodNok(listInt).primeFactors();
    simpleDelimeters = result.simpleDelimeters!;
    setState(() {});
  }
  @override
  void dispose() {
    _myControllerOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int lastNum = listInt.isEmpty ? 0 : listInt.last;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: listInt.length < 2 ? null : resultNokNod,
                        child: const Text('Посчитать НОД и НОК')),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        onPressed: listInt.isEmpty ? null : simpleDelimeterLastNum,
                        child: const Text('Простые делители')),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Простые делители числа $lastNum: $simpleDelimeters'),
                    Text('Наименьшее общее кратное $leastCommonMultiple'),
                    Text('Наибольший общий делитель $greatestCommonDivisor'),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  child: MyFormField(
                    controller: _myControllerOne,
                    hintText: 'Enter 0-9 digits only',
                    digitQuantity: 7,
                    maxLines: 1,
                    isValid: validateNumber,
                    validation: validate,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: validateNumber ? incrementField : null, child: const Text('Добавить число')),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: listInt.isNotEmpty ? decrementField : null, child: const Text('Убрать')),
              ],
            ),
            Wrap(
              spacing: 10,
              children: [
                ...List.generate(
                    listInt.length,
                    (index) => SizedBox(
                        width: 100,
                        child: NumbersView(
                          number: listInt[index],
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
