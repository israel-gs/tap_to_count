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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          mainController.isDarkMode.value ? 'darkText'.tr : 'lightText'.tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
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
