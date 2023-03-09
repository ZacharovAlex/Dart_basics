// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:skillboxdemo/skillbox_work2_logic/logic_number_five.dart';



void main() {

  test('Найти числа в массиве по их текстовому названию', () {
    final findWordsNumbers = FindNumbersWords();
    final result =   findWordsNumbers.findNumbers(['one','петя','five','валя','three','five','two']);
    expect(result, {1,5,3,2});

  });


}
