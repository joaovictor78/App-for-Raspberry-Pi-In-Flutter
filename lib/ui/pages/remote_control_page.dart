import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../controllers/remote_control_controller.dart';
import '../../services/remote_control_service.dart';
import '../components/change_settings_button_component.dart';
import '../components/power_button_component.dart';

class RemoteControlPage extends StatefulWidget {
  final String _deviceAddress;
  const RemoteControlPage({required String deviceAddress, super.key})
      : _deviceAddress = deviceAddress;

  @override
  State<RemoteControlPage> createState() => _RemoteControlPageState();
}

class _RemoteControlPageState extends State<RemoteControlPage> {
  late RemoteControlController _controller;
  double percent = 0;
  @override
  void initState() {
    log(widget._deviceAddress);
    _controller = RemoteControlController(service: RemoteControlService());
    _controller.startConnection(widget._deviceAddress);
    super.initState();
  }

  @override
  void dispose() {
    _controller.closeConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                Text(
                  'Uni',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Controller',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            PowerButtonComponent(
                isActive: _controller.isOn,
                onTap: () {
                  setState(() {
                    _controller.turnOnOrOff();
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChangeSettingsButtonComponent(
                  type: 'FREQ',
                  onPressedUpIcon: () {
                    if (_controller.isOn) {
                      setState(() {
                        _controller.changeLedFrequency('add');
                      });
                    }
                  },
                  onPressedDownIcon: () {
                    if (_controller.isOn) {
                      setState(() {
                        _controller.changeLedFrequency('remove');
                      });
                    }
                  },
                  iconType: 'assets/frequency.png',
                  upIcon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  downIcon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                ChangeSettingsButtonComponent(
                  type: 'LED',
                  onPressedUpIcon: () {
                    if (_controller.isOn) {
                      setState(() {
                        _controller.changeLedSelected('R');
                      });
                    }
                  },
                  onPressedDownIcon: () {
                    if (_controller.isOn) {
                      setState(() {
                        _controller.changeLedSelected('G');
                      });
                    }
                  },
                  iconType: 'assets/led_on.png',
                  upIcon: Image.asset('assets/led.png',
                      color: _controller.ledSelected == 'R'
                          ? const Color(0xFFFF4B4E)
                          : const Color(0xFF460607)),
                  downIcon: Image.asset(
                    'assets/led.png',
                    color: _controller.ledSelected == 'G'
                        ? const Color(0xFF5FE82E)
                        : const Color(0xFF26421D),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _controller.ledSelected == 'R'
                        ? const Color(0xFFFF4B4E)
                        : const Color(0xFF460607),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1F1F1F),
                      ),
                      child: Center(
                          child: Text(
                        '${_controller.ledFrequency}%',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                    ),
                    CircularPercentIndicator(
                      radius: 60.0,
                      backgroundColor: Colors.transparent,
                      lineWidth: 4.0,
                      animationDuration: 500,
                      progressColor: _controller.ledSelected == 'R'
                          ? const Color(0xFFFF4B4E)
                          : const Color(0xFF5FE82E),
                      animation: true,
                      percent: _controller.ledFrequency / 100,
                    ),
                  ],
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _controller.ledSelected == 'G'
                        ? const Color(0xFF5FE82E)
                        : const Color(0xFF26421D),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
