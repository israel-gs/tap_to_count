import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_count/app/data/models/counter_model.dart';
import 'package:tap_to_count/app/data/services/counter/counter_repository.dart';
import 'package:tap_to_count/core/utils/alert_utils.dart';
import 'package:tap_to_count/routes/pages.dart';

class NewCounterController extends GetxController with StateMixin {
  final CounterRepository _counterRepository;

  final RxBool _hasMaxValue = false.obs;
  final counterNameController = TextEditingController();
  final _counterColor = Rx<Color?>(null);
  final _counterTextColor = Rx<Color?>(null);
  final _increment = Rx<double?>(null);
  final _maxValue = Rx<double?>(null);

  NewCounterController(this._counterRepository);

  onCreateCounterPress() {
    if (counterNameController.text.trim().isEmpty) {
      AlertUtils.showWarning(
        message: 'pleaseEnterNameForCounter'.tr,
      );
    } else {
      if (counterColor != null && counterTextColor != null) {
        final counter = CounterModel(
          id: 0,
          color: counterColor!.value,
          textColor: counterTextColor!.value,
          value: 0,
          name: counterNameController.text,
          increment: increment ?? 1,
          maxValue: maxValue,
        );
        createCounter(counter);
        Get.offAllNamed(Routes.home);
      } else {
        AlertUtils.showWarning(
          message: 'counterColor&TextColorRequired'.tr,
        );
      }
    }
  }

  createCounter(CounterModel counter) async {
    await _counterRepository.open('counters.db');
    await _counterRepository.insert(counter);
  }

  bool get hasMaxValue => _hasMaxValue.value;

  set hasMaxValue(bool value) => _hasMaxValue.value = value;

  double? get increment => _increment.value;

  set increment(double? value) => _increment.value = value;

  double? get maxValue => _maxValue.value;

  set maxValue(double? value) => _maxValue.value = value;

  Color? get counterColor => _counterColor.value;

  set counterColor(Color? value) => _counterColor.value = value;

  Color? get counterTextColor => _counterTextColor.value;

  set counterTextColor(Color? value) => _counterTextColor.value = value;
}
