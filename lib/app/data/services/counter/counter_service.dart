import 'package:get/get.dart';
import 'package:tap_to_count/app/data/models/counter_model.dart';
import 'package:tap_to_count/app/data/providers/counter_provider.dart';
import 'package:tap_to_count/app/data/services/counter/counter_repository.dart';

class CounterService extends GetxService {
  late CounterRepository _counterRepository;

  Future<CounterService> init() async {
    _counterRepository = CounterRepository(CounterProvider());
    return this;
  }

  Future<CounterModel> insert(CounterModel counter) async {
    return await _counterRepository.insert(counter);
  }

  Future<CounterModel?> getCounter(int id) async {
    return await _counterRepository.getCounter(id);
  }

  Future<List<CounterModel>> getCounters() async {
    return await _counterRepository.getCounters();
  }

  Future<int> update(CounterModel counter) async {
    return await _counterRepository.update(counter);
  }

  Future<int> delete(int id) async {
    return await _counterRepository.delete(id);
  }
}
