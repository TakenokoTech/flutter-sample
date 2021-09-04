import 'package:flutter/material.dart';
import 'package:flutter_sample/repository/UserRepository.dart';
import 'package:flutter_sample/usecase/AddUserUsecase.dart';

class UserAddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<UserAddPage> {
  String _text = '';

  void _confirmed(text) {
    if(text != null) {
      AddUserUsecase(UserRepository()).execute(text);
    }
    // "pop"の引数から前の画面にデータを渡す
    Navigator.of(context).pop(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text, style: TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _confirmed(_text),
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () => _confirmed(null),
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
