import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_count/main_controller.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({Key? key}) : super(key: key);

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SwitchListTile(
        activeThumbImage: const AssetImage('lib/assets/images/moon.png'),
        inactiveThumbImage: const AssetImage('lib/assets/images/sun.png'),
        activeColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: const EdgeInsets.all(0),
        controlAffinity: ListTileControlAffinity.leading,
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Row(
            key: ValueKey(mainController.isDarkMode.value),
            children: [
              Text(
                mainController.isDarkMode.value
                    ? 'darkText'.tr
                    : 'lightText'.tr,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        value: mainController.isDarkMode.value,
        onChanged: (value) {
          mainController.changeTheme();
        },
      ),
    );
  }
}
