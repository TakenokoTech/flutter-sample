import 'package:flutter/material.dart';
import 'package:flutter_sample/components/RippleCard.dart';
import 'package:flutter_sample/pages/DeviceListPage.dart';
import 'package:flutter_sample/repository/UserRepository.dart';
import 'package:flutter_sample/usecase/GetUserListUsecase.dart';

import 'UserAddPage.dart';

class UserListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage> {
  List<User> users = [];

  void updateList() {
    GetUserListUsecase(UserRepository()).execute().then((v) => setState(() {
      users = v;
    }));
  }

  @override
  void initState() {
    super.initState();
    updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ユーザーリスト'),
      ),
      body: ListView(children: users.map((e) => RippleCard(
          text: e.name,
          func: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return DeviceListPage();
              }),
            );
          })).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return UserAddPage();
            }),
          );
          debugPrint(newText);
          updateList();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
