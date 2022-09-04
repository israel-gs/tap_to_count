import 'package:tap_to_count/app/data/models/counter_model.dart';
import 'package:tap_to_count/app/data/providers/counter_provider.dart';

class CounterRepository {
  final CounterProvider _counterProvider;

  CounterRepository(this._counterProvider);

  Future open(String path) async {
    await _counterProvider.open(path);
  }

  Future<CounterModel> insert(CounterModel counter) async {
    return await _counterProvider.insert(counter);
  }

  Future<CounterModel?> getCounter(int id) async {
    return await _counterProvider.getCounter(id);
  }

  Future<List<CounterModel>> getCounters() async {
    return await _counterProvider.getCounters();
  }

  Future<int> update(CounterModel counter) async {
    return await _counterProvider.update(counter);
  }

  Future<int> delete(int id) async {
    return await _counterProvider.delete(id);
  }
}
