import 'package:get/get.dart';
import 'package:tap_to_count/app/data/providers/counter_provider.dart';
import 'package:tap_to_count/app/data/services/counter/counter_repository.dart';
import 'package:tap_to_count/app/modules/counter_detail/counter_detail_controller.dart';

class CounterDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterDetailController>(
      () => CounterDetailController(
        CounterRepository(
          CounterProvider(),
        ),
      ),
    );
  }
}
