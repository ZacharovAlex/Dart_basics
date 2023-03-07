import 'dart:math';

class Result {
  int? greatestCommonDivisor;
  int? leastCommonMultiple;
  List<int>? simpleDelimeters;

  Result({this.greatestCommonDivisor, this.leastCommonMultiple, this.simpleDelimeters});
}

class NodNok {
  final List<int> data;

  NodNok(this.data);

  Result primeFactors() {
    var isNegative = false;
    var n = data.last;
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
    return Result(simpleDelimeters: primeFactors);
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

  Result gcdList() {
    List<int> result = [0, 0];
    for (var i = 0; i < data.length - 1; i++) {
      if (data[i] < 0) {
        throw 'Нельзя отрицательные числа!';
      }
      if (i > 0) {
        result[0] = _gcd(result[0], data[i + 1]);
        result[1] = _lcm(result[1], data[i + 1]);
      } else {
        result[0] = _gcd(data[i], data[i + 1]);
        result[1] = _lcm(data[i], data[i + 1]);
      }
    }
    return Result(greatestCommonDivisor: result[0], leastCommonMultiple: result[1]);
  }
}
