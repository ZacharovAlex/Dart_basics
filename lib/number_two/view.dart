import 'package:flutter/material.dart';
import 'package:skillboxdemo/extension_validation.dart';

import '../commonClasses.dart';
import 'package:skillbox_dart_basics/skillbox_dart_basics.dart';


class NumberTwoView extends StatefulWidget {
  final String title;

  const NumberTwoView({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberTwoView> createState() => _NumberTwoViewState();
}

class _NumberTwoViewState extends State<NumberTwoView> {
  final _controllerDecimals = TextEditingController();
  final _controllerBinary = TextEditingController();
  double? resultToDecimal ;
  var resultToBinary = '';
  var _currentAccuracy=5;
  bool isBinaryFloat =false;
  bool isFloat =false;

  validateBinary(String s){
    isBinaryFloat= s.isBinaryFloat();
    setState(() {
    });
  }
  validateFloat(String s){
    isFloat= s.isFloat();
    setState(() {
    });
  }


  void toDecimal() {
    final data = _controllerBinary.text.isEmpty ? '0' : _controllerBinary.text;

    resultToDecimal = BinaryDecimalSystem().toDecimal(data,_currentAccuracy);
    setState(() {});
  }

  void toBinary() {
    final data = _controllerDecimals.text.isEmpty ? '0' : _controllerDecimals.text;
    resultToBinary = BinaryDecimalSystem().toBinary(double.parse(data),_currentAccuracy);
    setState(() {});
  }

  void onChangeSlider(double value){
    _currentAccuracy = value.toInt();
    setState(() {

    });
  }
  @override
  void dispose() {
    _controllerDecimals.dispose();
    _controllerBinary.dispose();
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyFormField(
                          controller: _controllerBinary,
                          hintText: 'Enter 0-1 digits only',
                          digitQuantity: 30,
                          maxLines: 1,
                          isValid: isBinaryFloat,
                          validation: validateBinary,
                        ),
                        ElevatedButton(onPressed:isBinaryFloat? toDecimal:null, child: const Text('В десятичную')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyFormField(
                          controller: _controllerDecimals,
                          hintText: 'Enter 0-9 digits only',
                          digitQuantity: 15,
                          maxLines: 1,
                          isValid: isFloat,
                          validation: validateFloat,
                        ),
                        ElevatedButton(onPressed:isFloat? toBinary:null, child: const Text('В двоичную')),
                      ],
                    ),
                  ),
                ],
              ),
              Text('Точность (Знаков после запятой) $_currentAccuracy'),
              Slider(
                  value: _currentAccuracy.toDouble() ,
                  max: 20,
                  min: 1,
                  label: _currentAccuracy.round().toString(),
                  onChanged: (double value){onChangeSlider(value);}

              ),
              resultToBinary != ''
                  ? Column(
                      children: [
                        const Text('В двоичном представлении '),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              resultToBinary,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            )),
                      ],
                    )
                  : const SizedBox(),
              resultToDecimal != null
                  ? Column(
                      children: [
                        const Text('В десятичном представлении '),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            resultToDecimal.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
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
