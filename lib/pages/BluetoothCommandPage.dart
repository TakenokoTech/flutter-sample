import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_sample/components/RippleCard.dart';
import 'package:flutter_sample/repository/BluetoothRepository.dart';

class BluetoothCommandPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BluetoothCommandPage();
}

class _BluetoothCommandPage extends State<BluetoothCommandPage> {
  List<ScanResult> device = [];

  void update() {
    BluetoothRepository().scan((results){
      setState(() {
        device = results;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ユーザーリスト'),
      ),
      body: ListView(children: device.map((e) => RippleCard(
          text: e.device.name == "" ? "null" : e.device.name,
          detail: "address: ${e.device.id.id}, rssi = ${e.rssi}",
          func: () async {
            await BluetoothRepository().connect(e);
          })).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("onPressed");
          update();
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
