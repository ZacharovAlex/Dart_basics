import 'package:flutter/material.dart';

class User with MailSystem {
  final String email;

  User(this.email);
}

class AdminUser extends User {
  AdminUser(super.email);

  @override
  String get email => getMailSystem(super.email);
}

class GeneralUser extends User {
  GeneralUser(super.email);
}

mixin MailSystem {
  String getMailSystem(String email) {
    return email.substring(email.indexOf('@') + 1, email.length);
  }
}

class UserManager<T extends User> {
  List<User> userList = [User('dsds@dwds'), AdminUser('email@bdsdbh')];

  List<User> addUser(User user) {
    userList.add(user);
    return userList;
  }

  List<User> reduceUser() {
    if (userList.isNotEmpty) {
      userList.removeLast();
      return userList;
    } else {
      return userList;
    }
  }

  ListView printEmail() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Text(userList[index].email),
          );
        });
    //  }
  }
}
