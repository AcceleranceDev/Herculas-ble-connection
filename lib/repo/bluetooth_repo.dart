import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothRepo {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  Stream<List<BluetoothDevice>> discoveredBluetoothDevice() {
    return Stream.fromFuture(getDiscovered());
  }

  Future<List<BluetoothDevice>> getDiscovered() async {
    List<BluetoothDevice> devices = [];
    final data = await flutterBlue.startScan(timeout: Duration(seconds: 4));
    print("Data==-$data");
    flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        devices.add(r.device);

        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });
    return devices;
  }

  Stream<List<BluetoothDevice>> getBondedBluetoothDevices() {
    return Stream.fromFuture(flutterBlue.bondedDevices);
  }

  Stream<void> connectToNearByDevice({required BluetoothDevice device}) {
    return Stream.fromFuture(device.connect());
  }

  Stream<bool?> removeBondedBluetoothDevice({required BluetoothDevice device}) {
    return Stream.fromFuture(device.removeBond());
  }

  Stream<void> bondNewBluetoothDevice({required BluetoothDevice device}) {
    return Stream.fromFuture(device.pair());
  }

  Stream<BluetoothState> isBluetoothOn() {
    return flutterBlue.state;
  }

  Future<bool> turnOnBluetooth() async {
    return await flutterBlue.turnOn();
  }
}
