// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:skillboxdemo/skillbox_work2_logic/logic_number_four.dart';



void main() {

  test('Целые', () {
    final findWords = FindWords();
    final result =   findWords.findWords(['маша','петя','маша','валя','миша','петя','петя']);
    expect(result, {'маша':2,'петя':3,'валя':1,'миша':1});

  });


}
