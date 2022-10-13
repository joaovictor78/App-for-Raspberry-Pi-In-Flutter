import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class RemoteControlService {
  late BluetoothConnection _connection;

  Future<void> startConnection(String address) async {
    try {
      _connection = await BluetoothConnection.toAddress(address);
    } catch (error) {
      print('Cannot connect, exception occured');
    }
  }

  closeConnection() async {
    try {
      await _connection.finish();
    } catch (error) {
      print('Cannot close connection, exception occured');
    }
  }

  receiveData(void Function(String data) receiveData) {
    _connection.input!.listen((Uint8List data) {
      receiveData(ascii.decode(data));
    });
  }

  sendData(String data) {
    _connection.output.add(ascii.encode(data));
  }
}
