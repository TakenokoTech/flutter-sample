import 'package:flutter/material.dart';
import 'package:flutter_sample/repository/UserRepository.dart';
import 'package:flutter_sample/usecase/GetUserListUsecase.dart';

import 'UserAddPage.dart';

class UserListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    var users = GetUserListUsecase(UserRepository()).execute();
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      body: ListView(
          children: users
              .map((e) => Card(child: ListTile(title: Text(e.name))))
              .toList()
          // <Widget>[
          //   Card(
          //     child: ListTile(
          //       title: Text('ニンジンを買う'),
          //     ),
          //   ),
          // ],
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return UserAddPage();
            }),
          );
          debugPrint(newListText);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
