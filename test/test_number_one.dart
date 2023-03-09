// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:skillboxdemo/skillbox_work2_logic/logic_number_one.dart';

void main() {
  group('НОД НОК и простые делители', () {
    final nodnok = NodNok();
    test('Наибольший общий делитель', () {
      final gcd = nodnok.gcdFromList([2, 4]);
      final gcdNegative = nodnok.gcdFromList([2, -12, 18, -366]);
      expect(gcdNegative, 2);
      expect(gcd, 2);
    });

    test('Наименьшее общее кратное', () {
      final lcm1 = nodnok.lcmFromList([7, 11]);
      final lcm2Negative = nodnok.lcmFromList([2, -12, 15, 3]);

      expect(lcm1, 77);
      expect(lcm2Negative, 60);
    });

    test('простые делители', () {
      final simpleDelimetersPositive = nodnok.primeFactors(8);
      final simpleDelimetersNegative = nodnok.primeFactors(-8);

      expect(simpleDelimetersPositive, [2, 2, 2, 1]);
      expect(simpleDelimetersNegative, [2, 2, 2, -1]);
    });
  });
}

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());
//
//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);
//
//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();
//
//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
