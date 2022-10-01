import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tap_to_count/app/data/models/counter_model.dart';
import 'package:tap_to_count/app/modules/home/home_controller.dart';
import 'package:tap_to_count/app/modules/home/widgets/home_drawer.dart';
import 'package:tap_to_count/app/widgets/counter_item/counter_item_widget.dart';
import 'package:tap_to_count/app/widgets/slidable_item/slidable_item_widget.dart';
import 'package:tap_to_count/routes/pages.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  // scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'appBarTitleHome'.tr,
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.plus),
            onPressed: () {
              Get.toNamed(Routes.newCounter);
            },
            tooltip: 'newCounter'.tr,
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          tooltip: 'openDrawer'.tr,
        ),
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
        onEmpty: _buildEmptyList(),
      ),
    );
  }

  _buildCounterItem(CounterModel counter) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Slidable(
        key: ValueKey(counter.id),
        closeOnScroll: true,
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(
            confirmDismiss: () async {
              return await controller.deleteCounter(counter) ?? false;
            },
            onDismissed: () {},
            closeOnCancel: true,
          ),
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
            await Get.toNamed(Routes.counterDetail, arguments: [counter]);
            controller.getCounters();
          },
        ),
      ),
    );
  }

  _buildEmptyList() {
    return Stack(
      children: [
        Positioned(
          right: 40,
          child: SvgPicture.asset(
            'lib/assets/images/arrow.svg',
            color: Colors.grey,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/images/empty.svg',
              semanticsLabel: 'Empty list',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'noCountersFound'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              'createACounterToStart'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ],
    );
  }
}
