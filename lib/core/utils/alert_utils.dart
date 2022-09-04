import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AlertUtils {
  static showWarning({required String message}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.amberAccent,
      titleText: const SizedBox(),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      borderRadius: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    );
  }

  static showError({required String message}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      titleText: const SizedBox(),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      borderRadius: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    );
  }

  static showSuccess({required String message}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.greenAccent,
      titleText: const SizedBox(),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      borderRadius: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    );
  }

  static showInfo({required String message}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueAccent,
      titleText: const SizedBox(),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      borderRadius: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    );
  }

  static showCustom({required String message, required Color color}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      titleText: const SizedBox(),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      borderRadius: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    );
  }
}
