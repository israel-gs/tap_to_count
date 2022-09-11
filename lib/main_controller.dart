import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  MainController();

  late GetStorage box;

  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
    setTheme();
  }

  setTheme() {
    if (box.read('theme') == null) {
      box.write('theme', Get.isDarkMode ? 'dark' : 'light');
    }
    isDarkMode.value = box.read('theme') == 'dark';
    update();
    Get.changeThemeMode(
      box.read('theme') == 'dark' ? ThemeMode.dark : ThemeMode.light,
    );
  }

  changeTheme() {
    Get.changeThemeMode(
      isDarkMode.value ? ThemeMode.light : ThemeMode.dark,
    );
    box.write('theme', isDarkMode.value ? 'light' : 'dark');
    isDarkMode.value = !isDarkMode.value;
  }
}
