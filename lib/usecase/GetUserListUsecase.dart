import 'package:flutter_sample/repository/UserRepository.dart';

class GetUserListUsecase {
  final UserRepository repository;

  GetUserListUsecase(this.repository);

  Future<List<User>> execute() async {
    return repository.getUserList();
  }
}
