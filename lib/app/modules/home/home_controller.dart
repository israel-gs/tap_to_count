import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_count/app/data/models/counter_model.dart';
import 'package:tap_to_count/app/data/services/counter/counter_repository.dart';

class HomeController extends GetxController with StateMixin {
  final CounterRepository _counterRepository;

  HomeController(this._counterRepository);

  RxList<CounterModel> counters = <CounterModel>[].obs;

  @override
  void onInit() {
    getCounters();
    super.onInit();
  }

  Future getCounters() async {
    try {
      await _counterRepository.open('counters.db');
      counters(await _counterRepository.getCounters());
      counters.refresh();
      update();
      if (counters.isEmpty) {
        change(counters, status: RxStatus.empty());
      } else {
        change(counters, status: RxStatus.success());
      }
    } catch (e) {
      change(counters, status: RxStatus.error(e.toString()));
    }
  }

  updateCounter(CounterModel counter) async {
    await _counterRepository.update(counter);
    getCounters();
  }

  deleteCounter(CounterModel counter) async {
    Get.defaultDialog(
      radius: 10,
      title: 'Eliminar contador',
      middleText: '¿Estás seguro de eliminar este contador?',
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Cancelar'),
      ),
      confirm: ElevatedButton(
        child: const Text(
          'Eliminar contador',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        onPressed: () async {
          Get.back();
          await _counterRepository.delete(counter.id);
          counters.remove(counter);
          getCounters();
        },
      ),
    );
  }
}
