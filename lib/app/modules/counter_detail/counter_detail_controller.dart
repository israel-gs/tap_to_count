import 'package:get/get.dart';
import 'package:tap_to_count/app/data/models/counter_model.dart';
import 'package:tap_to_count/app/data/services/counter/counter_repository.dart';

class CounterDetailController extends GetxController with StateMixin {
  final CounterRepository _counterRepository;

  CounterDetailController(this._counterRepository);

  final _counter = Rx<CounterModel>(Get.arguments[0]);

  onIncrement() async {
    double maxValue = _counter.value.maxValue ?? double.infinity;
    if (_counter.value.value < maxValue) {
      var newCounter = counter;
      newCounter.value = newCounter.value + counter.increment;
      newCounter.value =
          newCounter.value > maxValue ? maxValue : newCounter.value;
      counter = newCounter;
      _counter.refresh();
      await updateCounter(newCounter);
    }
  }

  onDecrement() async {
    if (counter.value > 0) {
      var newCounter = counter;
      newCounter.value = newCounter.value - counter.increment;
      newCounter.value = newCounter.value < 0 ? 0 : newCounter.value;
      counter = newCounter;
      _counter.refresh();
      await updateCounter(newCounter);
    }
  }

  updateCounter(CounterModel counter) async {
    await _counterRepository.update(counter);
  }

  CounterModel get counter => _counter.value;

  set counter(CounterModel value) => _counter.value = value;
}
