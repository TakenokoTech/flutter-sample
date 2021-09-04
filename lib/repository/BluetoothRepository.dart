import 'package:flutter_blue/flutter_blue.dart';

class BluetoothRepository {
  static final BluetoothRepository _singleton =
      new BluetoothRepository._internal();

  factory BluetoothRepository() => _singleton;

  BluetoothRepository._internal();

  FlutterBlue flutterBlue = FlutterBlue.instance;

  void scan(Function callback) {
    flutterBlue.stopScan();
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    flutterBlue.scanResults.listen((results) {
      var filteredResults = results.where((element) => element.advertisementData.connectable).toList();
      // for (ScanResult result in results) {
        // print('${result.device.id.id} ${result.advertisementData.serviceUuids}, rssi: ${result.rssi}');
      // }
      callback(filteredResults);
    });
  }

  Future<void> connect(ScanResult result) async {
    print("result: $result");
    try {
      await result.device.connect(timeout: Duration(seconds: 4));
      var services = await result.device.discoverServices();
      print('services=${services.length}');
      var characteristics = services.first.characteristics;
      for(BluetoothCharacteristic c in characteristics) {
        print("characteristic=${await c.read()}");
      }
    } catch(e) {
      print("error ${result.device.id.id}");
    } finally {
      print("disconnect");
      result.device.disconnect();
    }
  }
}
