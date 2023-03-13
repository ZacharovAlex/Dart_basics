import 'dart:math';

// class Result {
//   int? greatestCommonDivisor;
//   int? leastCommonMultiple;
//   List<int>? simpleDelimeters;
//
//   Result({this.greatestCommonDivisor, this.leastCommonMultiple, this.simpleDelimeters});
// }

class NodNok {
  List<int> primeFactors(int value) {
    var isNegative = false;
    var n = value;
    if (n < 0) {
      n = n.abs();
      isNegative = true;
    }
    List<int> primeFactors = [];
    for (int i = 2; i <= (sqrt(n)).toInt() + 1; i++) {
      while (n % i == 0) {
        primeFactors.add(i);
        n = n ~/ i;
      }
    }
    isNegative ? primeFactors.add(n - 2 * n) : primeFactors.add(n);
    return primeFactors;
  }

  _swap(int a, int b) {
    var c = a;
    a = b;
    b = c;
  }

  int _gcd(int a, int b) {
    if (a < b) {
      _swap(a, b);
    }
    if (b != 0) {
      return _gcd(b, a % b);
    } else {
      return a;
    }
  }

  int _lcm(int a, int b) {
    try {
      return (a / _gcd(a, b) * b).toInt();
    } catch (e) {
      return 0;
    }
  }

  int gcdFromList(List<int> dataValues) {
    if (dataValues.length < 2) {
      throw 'Для подсчета нужно хотябы 2 числа!';
    }
   var result = _gcd(dataValues[0], dataValues[1]);

    for (var i = 2; i < dataValues.length - 1; i++) {
      // if (dataValues[i] < 0) {
      //   throw 'Нельзя отрицательные числа!';
      // }
    //  result = _gcd(dataValues[i], dataValues[i + 1]);
        result = _gcd(result, dataValues[i]);


    }
    return result.abs();
  }

  int lcmFromList(List<int> dataValues) {
    if (dataValues.length < 2) {
      throw 'Для подсчета нужно хотябы 2 числа!';
    }
    var result = _lcm(dataValues[0], dataValues[1]);
    for (var i = 2; i < dataValues.length - 1; i++) {
      // if (dataValues[i] < 0) {
      //   throw 'Нельзя отрицательные числа!';
      // }
      result = _lcm(result, dataValues[i]);
    }
    return result.abs();
  }
}
