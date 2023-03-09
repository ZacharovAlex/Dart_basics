// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:skillboxdemo/skillbox_work2_logic/logic_number_two.dart';

void main() {
  group('Двоичная-десятичная', () {
    final binaryDecimal = BinaryDecimalSystem();
    test('Первод в двоичную', () {
      final binary = binaryDecimal.toBinary(546.91163, 10);
      final binaryZero = binaryDecimal.toBinary(0.166, 10);
      final binaryInt = binaryDecimal.toBinary(17, 10);
      final binaryIntNegative = binaryDecimal.toBinary(-865, 10);
      expect(binary, '1000100010,1110100101');
      expect(binaryZero, '0,0010101001');
      expect(binaryInt, '10001');
      expect(binaryIntNegative, '-1101100001');
    });

    test('Первод в десятичную', () {
      final decimal = binaryDecimal.toDecimal('1000100010.1110100101', 10);
      final decimalZero = binaryDecimal.toDecimal('0.0010101001111111', 10);
      final decimalInt = binaryDecimal.toDecimal('10001.0', 10);
      final decimalIntNegative = binaryDecimal.toDecimal('-1101100001.0', 10);
      //  final fdfd = double.parse('1000100010.1110100101');
      //   expect(fdfd, 1000100010.111);
      expect(decimal, 546.9111328125);
      expect(decimalZero, 0.1650390625);
      expect(decimalInt, 17);
      expect(decimalIntNegative, -865);
    });
  });
}
