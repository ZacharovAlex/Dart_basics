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
  List<T> userList = [];

  List<T> addUser(T user) {
    userList.add(user);
    return userList;
  }

  List<T> reduceUser() {
    if (userList.isNotEmpty) {
      userList.removeLast();
      return userList;
    } else {
      return userList;
    }
  }

  List<String> printEmail() {
    List<String> mailList = [];
    for (var user in userList) {
      mailList.add(user.email);
    }
    return mailList;
  }
}

// ListView.builder(
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// itemCount: userList.length,
// itemBuilder: (context, index) {
// return Card(
// child: Text(userList[index].email),
// );
// });
