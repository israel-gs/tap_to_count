import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_count/app/modules/edit_counter/edit_counter_controller.dart';
import 'package:tap_to_count/app/widgets/color_picker/color_picker_widget.dart';
import 'package:tap_to_count/app/widgets/numeric_input/numeric_input_widget.dart';

class EditCounterScreen extends GetView<EditCounterController> {
  const EditCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'editCounter'.tr,
              ),
              actions: const [],
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('inputNameLabelEditCounter'.tr),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controller.counterNameController,
                        decoration: InputDecoration(
                          hintText: 'inputNameHintEditCounter'.tr,
                        ),
                        style: Theme.of(context).textTheme.labelMedium,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'inputNameHelpEditCounter'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildLabel('inputIncrementLabelEditCounter'.tr),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: NumericInputWidget(
                          currentValue: controller.counter.increment,
                          min: 1,
                          onChanged: (value) {
                            controller.increment = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildLabel('inputBackgroundColorLabelEditCounter'.tr),
                      const SizedBox(height: 10),
                      ColorPickerWidget(
                        initialColor: Color(controller.counter.color),
                        onColorChanged: (color) {
                          controller.counterColor = color;
                          controller.counterTextColor =
                              color.computeLuminance() > 0.5
                                  ? Colors.black
                                  : Colors.white;
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildCheckbox(),
                      AnimatedSwitcher(
                        switchInCurve: Curves.easeIn,
                        switchOutCurve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                        child: controller.hasMaxValue
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: NumericInputWidget(
                                  currentValue: controller.counter.maxValue,
                                  min: 1,
                                  enableInput: true,
                                  onChanged: (value) {
                                    controller.maxValue = value;
                                  },
                                ),
                              )
                            : const SizedBox(),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: controller.onUpdateCounterPress,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'buttonCreateCounterTextEditCounter'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  _buildCheckbox() {
    return CheckboxListTile(
      title: Text(
        'checkboxLimitLabelEditCounter'.tr,
        style: TextStyle(
          fontSize: 16,
          color: Get.theme.textTheme.labelMedium?.color,
        ),
      ),
      value: controller.hasMaxValue,
      onChanged: (newValue) {
        controller.hasMaxValue = newValue ?? false;
        controller.maxValue = newValue != null && !newValue ? null : 0;
      },
      controlAffinity: ListTileControlAffinity.leading,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(
        color: Get.theme.textTheme.labelMedium?.color ?? Colors.transparent,
        width: 2,
      ),
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  _buildLabel(String label) {
    final ThemeData theme = Get.theme;
    return Text(
      label,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: theme.textTheme.labelMedium?.color,
      ),
    );
  }
}
