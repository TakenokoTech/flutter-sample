import 'package:flutter_sample/repository/UserRepository.dart';

class GetUserListUsecase {
  final UserRepository repository;

  GetUserListUsecase(this.repository);

  Future<List<User>> execute() async {
    return [
      User(name: "User A"),
      User(name: "User B"),
      User(name: "User C")
    ];
  }
}

class User {
  String name;
  User({required this.name});
}