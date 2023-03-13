// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:skillboxdemo/skillbox_work2_logic/logic_number_eight.dart';

void main() {
  test('Юзер менеджер', () {
    final userManager = UserManager();
    userManager.addUser(User('Alex@gmail.ru'));
    userManager.addUser(AdminUser('AlexAdmin@admin.ru'));
    expect(userManager.userList.length, 2);
    expect(userManager.printEmail(), ['Alex@gmail.ru', 'admin.ru']);
    userManager.reduceUser();
    expect(userManager.userList.length, 1);
  });
}
