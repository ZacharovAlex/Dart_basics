// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:skillboxdemo/skillbox_work2_logic/logic_number_three.dart';

void main() {
  test('Целые', () {
    final numsString = ParseStringForNum();
    final result = numsString.parsing('12.0, 430..54fggf87-65.76.8700 fgfggsd00544 43.7 -0 ');
    expect(result, [12, 430, 54, 87, -65.76, 8700, 544, 43.7, 0]);
  });
}
