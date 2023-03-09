// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:skillboxdemo/skillbox_work2_logic/logic_number_six.dart';



void main() {

  test('Расстояние и площадь треугольника', () {
    final point1 = MyPoint(x: 0, y: 0, z: 0);
    final result1 =   point1.distanceTo(MyPoint(x: 1, y: 0, z: 0));
    expect(result1, 1);


    final point2 = MyPoint(x: 1, y: 1, z: 1);
    final result2 =   point2.distanceTo(MyPoint(x: 1, y: 0, z: 7));
    expect(result2, 6.082762530298219);

    final point3 = MyPoint(x: 0, y: 1, z: 0);
    final result3 =   point3.triangleSquare(MyPoint(x: 0, y: 7, z: 0), MyPoint(x: 0, y: 0, z: 5));
    expect(result3, 14.99999999999999);
  });


}
