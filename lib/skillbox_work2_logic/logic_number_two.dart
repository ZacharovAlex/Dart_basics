import 'dart:math';

class BinaryDecimalSystem {
  List<int> _stringToArray(String x) {
    var result = <int>[];
    for (var i = 0; i < x.length; i++) {
      result.add(int.parse(x[i]));
    }
    return result;
  }

  double? toDecimal(String binary, int accuracy) {
    bool isBinaryFloat =
        RegExp(r'^(?:-?(?:[0-1]+))?(?:\.[0-1]*)?(?:[eE][\+\-]?(?:[0-1]+))?$').hasMatch(binary.toString());
    if (!isBinaryFloat) {
      throw 'Не могу распознать бинарное число, если оно не целое - отделяйте точкой';
    }
    if (double.parse(binary) == 0) {
      return 0;
    }
    var dataInt = '';
    var dataFloat = '';
    var resFloat = 0.0;
    var resInt = 0;
    var dataFloatArray = [];
    var isFloat = false;
    if (double.parse(binary).abs() - double.parse(binary).abs().round() != 0) {
      isFloat = true;
      dataInt = _intSide(binary.toString()).abs().toString();
      dataFloat = _floatSide(binary.toString());
      dataFloatArray = _stringToArray(dataFloat);
      if (dataFloatArray.length < accuracy) {
        dataFloatArray.addAll(List<int>.filled(accuracy - dataFloatArray.length, 0));
      }
      for (var i = 0; i < accuracy; i++) {
        resFloat += dataFloatArray[i] / pow(2, i + 1);
      }
    } else {
      dataInt = double.parse(binary).toInt().abs().toString();
    }

    for (var digit in _stringToArray(dataInt)) {
      resInt <<= 1;
      resInt |= digit;
    }
    if (isFloat) {
      return binary.startsWith('-')
          ? double.tryParse('-${resInt + resFloat}')
          : double.tryParse('${resInt + resFloat}');
    } else {
      return binary.startsWith('-') ? double.tryParse('-$resInt') : double.tryParse(resInt.toString());
    }
  }

  String toBinary(double decimal, int accuracy) {
    if (decimal == 0) {
      return '0';
    }
    var result = '';
    var resWholePart = <int>[];
    var resFloat = <String>[];
    var dataInt = 0;
    var dataFloat = 0.0;
    bool isFloat = false;
    if (decimal.abs() - decimal.abs().round() != 0) {
      isFloat = true;
      dataInt = _intSide(decimal.toString());
      dataFloat = double.parse('0.${_floatSide(decimal.toString())}') * 2;
    } else {
      dataInt = decimal.toInt();
    }

    if (dataInt != 0) {
      while (dataInt ~/ 2 != 0) {
        resWholePart.add((dataInt % 2));
        dataInt = dataInt ~/ 2;
      }
      resWholePart.add(1);
      resWholePart = resWholePart.reversed.toList();
    } else {
      resWholePart.add(0);
    }
    if (isFloat) {
      if (dataFloat != 0) {
        while (int.parse(_floatSide((dataFloat).toString())) != 0 && resFloat.length < accuracy - 1) {
          _intSide(dataFloat.toString()) != 0 ? resFloat.add('1') : resFloat.add('0');
          dataFloat = double.parse('0.${_floatSide(dataFloat.toString())}') * 2;
        }
        resFloat.add('1');
      } else {
        resFloat.add('1');
      }
    }
    if (isFloat) {
      result = "${resWholePart.join().toString()},${resFloat.join().toString()}";
    } else {
      result = resWholePart.join().toString();
    }

    return decimal.isNegative ? '-$result' : result;
  }

  String _floatSide(String x) {
    String result = '';
    result = x.substring(x.indexOf('.') + 1, x.length);
    return result;
  }

  int _intSide(String x) {
    int result = 0;
    result = int.parse(x.substring(0, x.indexOf('.')));
    return result;
  }
}
