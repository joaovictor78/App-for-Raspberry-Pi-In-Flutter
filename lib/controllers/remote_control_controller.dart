import 'dart:developer';

import '../services/remote_control_service.dart';

class RemoteControlController {
  bool isOn = false;
  String ledSelected = 'R';
  int ledFrequency = 1;
  final RemoteControlService _service;
  RemoteControlController({required RemoteControlService service})
      : _service = service;

  Future<void> startConnection(String address) async {
    await _service.startConnection(address);
  }

  void closeConnection() {
    _service.closeConnection();
  }

  void turnOnOrOff() {
    isOn = !isOn;
    if (isOn) {
      _service.sendData('H');
    } else {
      ledSelected = 'R';
      ledFrequency = 1;
      _service.sendData('L');
    }
  }

  void changeLedSelected(String led) {
    ledSelected = led;
    _service.sendData(led);
  }

  void changeLedFrequency(String type) {
    if (type == 'add') {
      ledFrequency++;
      if (ledFrequency > 100) ledFrequency = 100;
    } else if (type == 'remove') {
      ledFrequency--;
      if (ledFrequency < 0) ledFrequency = 0;
    }
    log((ledFrequency * 10).toString());
    _service.sendData('FREQ $ledFrequency');
  }
}
