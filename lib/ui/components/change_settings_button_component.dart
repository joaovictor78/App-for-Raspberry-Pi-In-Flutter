import 'package:flutter/material.dart';

class ChangeSettingsButtonComponent extends StatelessWidget {
  String type;
  String iconType;

  Widget upIcon;
  Widget downIcon;

  void Function()? onPressedUpIcon;
  void Function()? onPressedDownIcon;

  ChangeSettingsButtonComponent(
      {required this.type,
      required this.iconType,
      required this.upIcon,
      required this.onPressedUpIcon,
      required this.onPressedDownIcon,
      required this.downIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Image.asset(iconType, color: Colors.white),
        ),
        Container(
          height: 200,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFF1F1F1F),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: onPressedUpIcon, icon: upIcon),
                Text(
                  type,
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(onPressed: onPressedDownIcon, icon: downIcon)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
