import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tap_to_count/app/data/models/counter_model.dart';
import 'package:tap_to_count/app/modules/home/home_controller.dart';
import 'package:tap_to_count/app/modules/home/widgets/home_drawer.dart';
import 'package:tap_to_count/app/widgets/counter_item/counter_item_widget.dart';
import 'package:tap_to_count/app/widgets/slidable_item/slidable_item_widget.dart';
import 'package:tap_to_count/routes/pages.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contadores',
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.plus),
            onPressed: () {
              Get.toNamed(Routes.newCounter);
            },
          ),
        ],
      ),
      drawer: const HomeDrawerWidget(),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => Column(
                children: [
                  ...controller.counters
                      .map(
                        (counter) => _buildCounterItem(counter),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
        ),
        onEmpty: const Center(
          child: Text('No se encontraron contadores'),
        ),
      ),
    );
  }

  _buildCounterItem(CounterModel counter) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Slidable(
        key: ValueKey(counter.id),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            controller.deleteCounter(counter);
          }),
          children: [
            SlidableItemWidget(
              backgroundColor: Colors.redAccent,
              onTap: () {
                controller.deleteCounter(counter);
              },
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.white,
              ),
            ),
          ],
        ),
        child: CounterItemWidget(
          counter: counter,
          onIncrement: (newCounter) {
            controller.updateCounter(newCounter);
          },
          onTap: (counter) async {
            Get.toNamed(Routes.counterDetail, arguments: [counter])?.then(
              (value) {
                controller.getCounters();
              },
            );
          },
        ),
      ),
    );
  }
}
