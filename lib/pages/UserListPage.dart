import 'package:flutter/material.dart';
import 'package:flutter_sample/components/RippleCard.dart';
import 'package:flutter_sample/repository/UserRepository.dart';
import 'package:flutter_sample/usecase/GetUserListUsecase.dart';

import 'UserAddPage.dart';

class UserListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    GetUserListUsecase(UserRepository()).execute().then((v) => setState(() {
          users = v;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      body: ListView(children: users.map((e) => RippleCard(
          text: e.name,
          func: (){
            debugPrint("aaa");
          })).toList()),
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

  @override
  void dispose() {
    super.dispose();
  }
}
