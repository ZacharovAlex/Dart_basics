import 'dart:math';

class MyPoint {
  final double x;
  final double y;
  final double z;

  MyPoint({required this.x, required this.y, required this.z});

  @override
  String toString() {
    return 'x:$x,y:$y,z:$z';
  }

  double distanceTo(MyPoint b) {
    final distance = _distanceBetween(this, b);
    return distance;
  }

  double _distanceBetween(MyPoint a, MyPoint b) {
    final distance = sqrt(pow((b.x - a.x), 2) + pow((b.y - a.y), 2) + pow((b.z - a.z), 2));
    return distance;
  }

  double triangleSquare(MyPoint b, MyPoint c) {
    var square = 0.0;
    MyPoint a = this;
    var sideA = _distanceBetween(a, b);
    var sideB = _distanceBetween(a, c);
    var sideC = _distanceBetween(b, c);
    var p = (sideA + sideB + sideC) / 2;
    square = sqrt(p * (p - sideA) * (p - sideB) * (p - sideC));
    return square;
  }

  factory MyPoint.zero() {
    return MyPoint(x: 0, y: 0, z: 0);
  }

  factory MyPoint.ort() {
    return MyPoint(x: 1, y: 1, z: 1);
  }
}
