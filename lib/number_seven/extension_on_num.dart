import 'dart:core';

extension Root on num {
  get a => this;

  double _myPow(double a, int n) {
    double res = 1;
    var mult = a;
    while (n != 0) {
      if (n % 2 != 0) {
        res *= mult;
      }
      mult *= mult;
      n >>= 1;
    }
    return res;
  }

  double? rootN(
    double n,
    int accur,
  ) {
    if (a < 0 || n <= 0 || accur < 0) {
      return null;
    }
    double accuracy = 1 / _myPow(10, accur);
    int mult;
    bool isDrob = false;
    if (n - n.toInt() != 0) {
      isDrob = true;
      mult = int.parse(n.toString().replaceAll('.', ''));
    } else {
      mult = n.toInt();
    }
    double result = a / 2;
    while (_modul(_myPow(result, mult) - a) > accuracy) {
      result = (1 / mult) * (((mult - 1) * result) + (a / (_myPow(result, mult - 1))));
    }
    if (isDrob) {
      result = _myPow(result, _kolvoZero(n));
    }
    return double.parse(result.toStringAsFixed(accur));
  }

  num _modul(double digit) {
    if (digit < 0) {
      digit = digit * -1;
      return digit;
    }
    return digit;
  }

  int _kolvoZero(double data) {
    var answer = '1';
    for (var i = 1; i < data.toString().length - 1; i++) {
      answer += '0';
    }
    return int.parse(answer);
  }
}
