import 'package:flutter_sample/repository/UserRepository.dart';

class AddUserUsecase {
  final UserRepository repository;

  AddUserUsecase(this.repository);

  Future<void> execute(String name) async {
    repository.addUser(User(name: name));
  }
}
