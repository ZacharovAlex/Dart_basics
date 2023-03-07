import 'dart:math';

class BinaryDecimalSystem {
  final String data;
  final int accuracy;

  BinaryDecimalSystem(this.data, this.accuracy);

  List<int> _stringToArray(String x) {
    var result = <int>[];
    for (var i = 0; i < x.length; i++) {
      result.add(int.parse(x[i]));
    }
    return result;
  }

  String toDecimal() {
    bool isNegative = false;
    if (double.tryParse(data) == 0) {
      return '0';
    }
    if (data.startsWith('-')) {
      isNegative = true;
    }
    final binaryData = data.replaceAll('-', '');
    var dataInt = '';
    var dataFloat = '';
    var resFloat = 0.0;
    var resInt = 0;
    var dataFloatArray = [];
    var isFloat = false;
    if (binaryData.contains('.')) {
      isFloat = true;
      dataInt = _intSide(binaryData).toString();
      dataFloat = _floatSide(binaryData);

      dataFloatArray = _stringToArray(dataFloat);

      if (dataFloatArray.length < accuracy) {
        dataFloatArray.addAll(List<int>.filled(accuracy - dataFloatArray.length, 0));
      }
      for (var i = 0; i < accuracy; i++) {
        resFloat += dataFloatArray[i] / pow(2, i + 1);
      }
    } else {
      dataInt = binaryData;
    }

    for (var digit in _stringToArray(dataInt)) {
      resInt <<= 1;
      resInt |= digit;
    }
    if (isFloat) {
      return isNegative ? '-${resInt + resFloat}' : (resInt + resFloat).toString();
    } else {
      return isNegative ? '-$resInt' : resInt.toString();
    }
  }

  String toBinary() {
    if (double.parse(data) == 0) {
      return '0';
    }
    bool isNegative = false;
    if (data.startsWith('-')) {
      isNegative = true;
    }
    var result = '';
    var resWholePart = <int>[];
    var resFloat = <String>[];
    var dataInt = 0;
    var dataFloat = 0.0;
    bool isFloat = false;
    if (data.contains('.')) {
      isFloat = true;
      dataInt = _intSide(data);
      dataFloat = double.parse('0.${_floatSide(data)}') * 2;
      dataFloat = double.parse('0.${_floatSide(dataFloat.toString())}');
    } else {
      dataInt = int.parse(data);
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
        while (int.parse(_floatSide((dataFloat).toString())) != 0 && resFloat.length < accuracy) {
          _intSide(dataFloat.toString()) != 0 ? resFloat.add('1') : resFloat.add('0');

          dataFloat = double.parse('0.${_floatSide(dataFloat.toString())}') * 2;
        }
      } else {
        resFloat.add('1');
      }
    }
    if (isFloat) {
      result = "${resWholePart.join().toString()},${resFloat.join().toString()}";
    } else {
      result = resWholePart.join().toString();
    }

    return isNegative ? '-$result' : result;
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
