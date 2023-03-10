// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:skillboxdemo/skillbox_work2_logic/logic_number_nine.dart';




void main() {

  test('Интеграл Римана (площадь)', () {

    var rimanAnswer1 =  RimanAnswer();
    final rimanApi = Riman();//TODO первая переменная - функция , вторая и третья "ОТ и ДО", четвертая переменная - количество разбиений(прямоугольников), пятая - количество знаков после запятой в ответе
   rimanAnswer1= rimanApi.resultRiman('x^2', -1, 1, 3000,2);

   //TODO answer - ответ , badPoints - точки где нет значений у функции (точки разрыва), accuracy - длина отрезочка(дискретность) по X после разбиения, error - ошибки
   expect(rimanAnswer1.answer,0.67);
    expect(rimanAnswer1.infinitePoints, []);
    expect(rimanAnswer1.accuracy,'0.0006666666666666666');
    expect(rimanAnswer1.error,null);


    var rimanAnswer2 =  RimanAnswer();
    rimanAnswer2= rimanApi.resultRiman('sqrt(x)', -1, 1, 1000,2);
    expect(rimanAnswer2.answer,0.67);
    expect(rimanAnswer2.badPointsDiapazon!.first,'-1.00');
    expect(rimanAnswer2.badPointsDiapazon!.last,'-0.00');

    expect(rimanAnswer2.accuracy,'0.002');
    expect(rimanAnswer2.error,null);

    var rimanAnswer3 =  RimanAnswer();
    rimanAnswer3= rimanApi.resultRiman('sqrt(x)fhffgh', -1, 1, 1000,2);
    expect(rimanAnswer3.error,'Не могу преобразовать формулу!');
    expect(rimanAnswer3.answer,null);
    // expect(rimanAnswer3.badPointsDiapazon!.first,'-1.00');
    // expect(rimanAnswer3.badPointsDiapazon!.last,'-0.00');

    expect(rimanAnswer3.accuracy,null);

  });


}
