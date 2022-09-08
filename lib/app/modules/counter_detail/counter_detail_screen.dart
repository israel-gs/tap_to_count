import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tap_to_count/app/data/models/counter_model.dart';
import 'package:tap_to_count/app/modules/counter_detail/counter_detail_controller.dart';

final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

class CounterDetailScreen extends GetView<CounterDetailController> {
  const CounterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterModel counter = controller.counter;
    var backgroundColor = Color(counter.color);
    final Color foregroundColor = backgroundColor.computeLuminance() > 0.5
        ? Colors.black87
        : Colors.white;

    TextStyle numberStyle = TextStyle(
      fontSize: 100,
      fontWeight: FontWeight.w600,
      color: foregroundColor,
    );
    TextStyle titleStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: foregroundColor,
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.gear),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.counter.value.toString().replaceAll(regex, ''),
                style: numberStyle,
              ),
            ),
            const SizedBox(height: 10),
            counter.maxValue != null
                ? Text(
                    'de ${counter.maxValue.toString().replaceAll(regex, '')}',
                    style: titleStyle.copyWith(
                      fontSize: 14,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 20),
            Text(
              counter.name,
              style: titleStyle,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: backgroundColor,
                      shape: const CircleBorder(),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                    onPressed: () {
                      controller.onDecrement();
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.minus,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: backgroundColor,
                      shape: const CircleBorder(),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                    onPressed: () {
                      controller.onIncrement();
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.plus,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
