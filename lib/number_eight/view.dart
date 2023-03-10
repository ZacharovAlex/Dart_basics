import 'package:flutter/material.dart';
import 'package:skillboxdemo/extension_validation.dart';
import '../commonClasses.dart';
import 'package:skillbox_dart_basics/skillbox_dart_basics.dart';


class NumberEightView extends StatefulWidget {
  final String title;

  const NumberEightView({Key? key, required this.title}) : super(key: key);

  @override
  State<NumberEightView> createState() => _NumberEightViewState();
}

class _NumberEightViewState extends State<NumberEightView> {
  final _controllerEmail = TextEditingController();
  var userManager = UserManager();
  var isAdmin = false;
  bool isValid = false;

  validateText(String s) {
    isValid = s.isEmail();
    setState(() {});
  }

  void deleteUser() {
    userManager.reduceUser();
    setState(() {});
  }

  void addUser() {
    if (isAdmin) {
      userManager.addUser(AdminUser(_controllerEmail.text));
    } else {
      userManager.addUser(User(_controllerEmail.text));
    }

    setState(() {});
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: MyFormField(
                        inputType: TextInputType.emailAddress,
                        isValid: isValid,
                        validation: validateText,
                        controller: _controllerEmail,
                        digitQuantity: 20,
                        hintText: 'Введите Email',
                      )),
                  Column(
                    children: [
                      const Text('Admin?'),
                      SizedBox(
                        width: 30,
                        child: CheckboxListTile(
                          value: isAdmin,
                          onChanged: (newValue) {
                            setState(() {
                              isAdmin = !isAdmin;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(onPressed: isValid ? addUser : null, child: const Text('Добавить')),
                      ElevatedButton(onPressed: deleteUser, child: const Text('Удалить')),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MailList(manager: userManager),
            ],
          ),
        ),
      ),
    );
  }
}

class MailList extends StatelessWidget {
  final UserManager manager;

  const MailList({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: manager.userList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Text(manager.printEmail()[index]),
          );
        });
  }
}
