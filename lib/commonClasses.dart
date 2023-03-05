import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillboxdemo/extension_validation.dart';

import 'numberSix/logic.dart';

class MyFormField extends StatelessWidget {
  final RegExp? regex;
  final TextEditingController controller;
  final String hintText;
  final int? digitQuantity;
  final int? maxLines;
  final TextInputType? inputType;
  final bool? isValid;
  Function(String s)? validation;


    MyFormField(
      {Key? key,
      this.regex,
      required this.controller,
      required this.hintText,
      this.digitQuantity,
      this.maxLines, this.inputType, this.isValid, this.validation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
       // FilteringTextInputFormatter.allow(regex??RegExp(r'[-]?([0-9]+([.][0-9]*)?|[.][0-9]+)')),
        LengthLimitingTextInputFormatter(digitQuantity??15),
      ],

      maxLines: maxLines??1,
      autofocus: false,
      keyboardType: inputType??TextInputType.number,
      controller: controller,
      onChanged:(value) {
       validation!(value);
      },
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          fontSize: 20,
        ),

        contentPadding: const EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
      const BorderSide(color: Colors.grey,width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
          BorderSide( color: isValid!?Colors.green: Colors.red,width: 2)),
      //  border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}

class NumbersView extends StatelessWidget {
  final int? number;
  final MyPoint? point;

  const NumbersView({
    Key? key,
    this.number,
    this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = number ?? point.toString();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Center(
        child: Text('$value'),
      ),
    );
  }
}
