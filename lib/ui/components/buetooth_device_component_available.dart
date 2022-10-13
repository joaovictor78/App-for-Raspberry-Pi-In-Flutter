import 'package:flutter/material.dart';

class BluetoothDeviceListEntry extends ListTile {
  BluetoothDeviceListEntry({
    required String address,
    required String deviceName,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
  }) : super(
            onTap: onTap,
            onLongPress: onLongPress,
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.devices),
            title: Text(deviceName),
            subtitle: Text(address.toString()));
}
