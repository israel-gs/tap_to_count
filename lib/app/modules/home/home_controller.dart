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
      titlePadding: const EdgeInsets.only(top: 20, bottom: 10),
      contentPadding: const EdgeInsets.only(bottom: 20),
      title: 'titleDeleteCounterHome'.tr,
      middleText: 'messageDeleteCounterHome'.tr,
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('buttonCancelDeleteCounterHome'.tr),
      ),
      confirm: ElevatedButton(
        child: Text(
          'buttonDeleteCounterHome'.tr,
          style: const TextStyle(
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
