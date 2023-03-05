import 'package:function_tree/function_tree.dart';

class RimanAnswer {
  String? accuracy;
  String? answer;
  List<String>? badPoints = [];
  List<double>? goodPoints = [];
  List<String>? infinitePoints = [];

  RimanAnswer({this.answer, this.badPoints, this.goodPoints, this.accuracy, this.infinitePoints});
}

class Riman {
  RimanAnswer resultRiman(String function, double x1, double x2, int accuracy) {
    RimanAnswer answer =
        RimanAnswer(answer: '', badPoints: [], goodPoints: [], accuracy: '', infinitePoints: []);
    var rasstoyanie = _rasstoianie(x1, x2);
    num expression = 0.0;
    SingleVariableFunction f;
    try {
      f = function.toSingleVariableFunction();
    } catch (e) {
      return RimanAnswer(answer: 'Не могу преобразовать формулу!');
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
        answer.badPoints!.add(x1.toStringAsFixed(2));
        expression = 0;
      }
      square += expression.abs() * shirina;

      x1 = x1 + shirina;
    }
    answer.answer = square.toString();
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
