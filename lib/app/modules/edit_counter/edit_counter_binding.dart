import 'package:get/get.dart';
import 'package:tap_to_count/app/data/providers/counter_provider.dart';
import 'package:tap_to_count/app/data/services/counter/counter_repository.dart';
import 'package:tap_to_count/app/modules/edit_counter/edit_counter_controller.dart';

class EditCounterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCounterController>(
      () => EditCounterController(
        CounterRepository(
          CounterProvider(),
        ),
      ),
    );
  }
}
