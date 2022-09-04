import 'package:get/get.dart';
import 'package:tap_to_count/app/data/providers/counter_provider.dart';
import 'package:tap_to_count/app/data/services/counter/counter_repository.dart';
import 'package:tap_to_count/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(
      CounterRepository(
        CounterProvider(),
      ),
    ));
  }
}
