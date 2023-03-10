// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:skillboxdemo/skillbox_work2_logic/extension_on_num_seven.dart';



void main() {

  test('Корень степеени N', () {

    final result =   24.rootN(1.26, 12);
    expect(result, 12.456778651249);
    final result1 =   5.3.rootN(0.2, 12);
    expect(result1, 4181.954930000003);
    final result2 =   9.9.rootN(2.13, 2);
    expect(result2, 2.93);
    final result3 =   0.rootN(1, 12);
    expect(result3, 0);
    final result4 =   1.rootN(2, 12);
    expect(result4, 1);
    final result5 =   1.rootN(-1, 12);
    expect(result5, null);
    final result6 =   0.rootN(0, 12);
    expect(result6, null);

  });


}
