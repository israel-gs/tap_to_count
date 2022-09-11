import 'package:get/get.dart';
import 'package:tap_to_count/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
