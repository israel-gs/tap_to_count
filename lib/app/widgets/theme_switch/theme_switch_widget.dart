import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:switcher_button/switcher_button.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({Key? key}) : super(key: key);

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SwitcherButton(
          onColor: Colors.white38,
          offColor: Colors.black38,
          value: _isSwitched,
          onChange: (value) {
            setState(() {
              _isSwitched = value;
            });
            Get.changeThemeMode(value ? ThemeMode.light : ThemeMode.dark);
          },
        ),
        const SizedBox(width: 10),
        Text(
          'Modo oscuro',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.labelMedium?.color,
          ),
        ),
      ],
    );
  }
}
