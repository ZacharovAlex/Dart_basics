import 'package:function_tree/function_tree.dart';

class RimanAnswer {
  String? accuracy;
  double? answer;
  String? error;
  List<String>? badPointsDiapazon = [];
  List<double>? goodPoints = [];
  List<String>? infinitePoints = [];

  RimanAnswer({this.answer, this.badPointsDiapazon, this.goodPoints, this.accuracy, this.infinitePoints,this.error});
}

class Riman {
  RimanAnswer resultRiman(String function, double x1, double x2, int accuracy,int afterDotCount) {
    RimanAnswer answer =
        RimanAnswer(answer: null, badPointsDiapazon: [], goodPoints: [], accuracy: '', infinitePoints: [], error: null);
    var rasstoyanie = _rasstoianie(x1, x2);
    num expression = 0.0;
    SingleVariableFunction f;
    try {
      f = function.toSingleVariableFunction();
    } catch (e) {
      return RimanAnswer(error: 'Не могу преобразовать формулу!');
    }
    var square = 0.0;
    var shirina = rasstoyanie / accuracy;
    answer.accuracy = shirina.toString();
    while (x1 <= x2) {
      expression = f(x1);
      if (expression.isInfinite) {
        answer.infinitePoints!.add(x1.toStringAsFixed(2));
        x1 = x1 + shirina;
        continue;
      }
      if (expression.isNaN) {
        answer.badPointsDiapazon!.add(x1.toStringAsFixed(2));
        expression = 0;
      }
      square += expression.abs() * shirina;

      x1 = x1 + shirina;
    }
    answer.answer = double.parse(square.toStringAsFixed(afterDotCount));
    return answer;
  }

  double _rasstoianie(double x1, double x2) {
    var rasstoianie = 0.0;
    if (x1 > x2) {
      -x1;
    }
    rasstoianie = x2 - x1;
    return rasstoianie.isNegative ? -rasstoianie : rasstoianie;
  }
}
