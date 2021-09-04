class UserRepository {
  static final UserRepository _singleton = new UserRepository._internal();
  factory UserRepository() => _singleton;
  UserRepository._internal();

  List<User> users = [
    User(name: "User A"),
    User(name: "User B"),
    User(name: "User C")
  ];

  Future<List<User>> getUserList() async {
    return users;
  }

  Future<void> addUser(User user) async {
    users.add(user);
  }
}

class User {
  String name;
  User({required this.name});
}