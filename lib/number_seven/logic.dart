class Calc {
  double a;
  double n;
  int accur;

  Calc(this.a, this.n, this.accur);

  double stepenSlow() {
    int mult;
    bool isDrob = false;
    double accuracy = 1 / vosvod(10, accur);
    if (n - n.toInt() != 0) {
      isDrob = true;
      mult = int.parse(n.toString().replaceAll('.', ''));
    } else {
      mult = n.toInt();
    }
    double result = a / 2;

    while (modul(vosvod(result, mult) - a) > accuracy) {
      result = (1 / mult) * (((mult - 1) * result) + (a / (vosvod(result, mult - 1))));
    }
    if (isDrob) {
      result = vosvod(result, kolvoZero(n));
    }
    return double.parse(result.toStringAsFixed(accur));
  }

  double vosvod(double digit, int stepen) {
    var x = digit;
    for (var i = 1; i < stepen; i++) {
      x = x * digit;
    }
    return x.toDouble();
  }

  num modul(double digit) {
    if (digit < 0) {
      digit = digit * -1;
      return digit;
    }
    return digit;
  }

  int kolvoZero(double data) {
    var answer = '1';
    for (var i = 1; i < data.toString().length - 1; i++) {
      answer += '0';
    }
    return int.parse(answer);
  }
}
