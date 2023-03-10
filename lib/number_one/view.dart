import 'package:flutter/material.dart';


import 'package:skillboxdemo/extension_validation.dart';
import '../commonClasses.dart';
import 'package:skillbox_dart_basics/skillbox_dart_basics.dart';

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
    greatestCommonDivisor = NodNok().gcdFromList(listInt);
    //print(greatestCommonDivisor);
    leastCommonMultiple = NodNok().lcmFromList(listInt);
   // greatestCommonDivisor = result.greatestCommonDivisor;
    setState(() {});
  }

  void simpleDelimeterLastNum() {
  //  var result = NodNok(listInt).primeFactors();
   simpleDelimeters = NodNok().primeFactors(listInt.last);
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
                        child: const Text('?????????????????? ?????? ?? ??????')),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        onPressed: listInt.isEmpty ? null : simpleDelimeterLastNum,
                        child: const Text('?????????????? ????????????????')),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('?????????????? ???????????????? ?????????? $lastNum: $simpleDelimeters'),
                    Text('???????????????????? ?????????? ?????????????? $leastCommonMultiple'),
                    Text('???????????????????? ?????????? ???????????????? $greatestCommonDivisor'),
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
                    onPressed: validateNumber ? incrementField : null, child: const Text('???????????????? ??????????')),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: listInt.isNotEmpty ? decrementField : null, child: const Text('????????????')),
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
