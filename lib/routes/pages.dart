import 'package:get/route_manager.dart';
import 'package:tap_to_count/app/modules/counter_detail/counter_detail_binding.dart';
import 'package:tap_to_count/app/modules/counter_detail/counter_detail_screen.dart';
import 'package:tap_to_count/app/modules/home/home_binding.dart';
import 'package:tap_to_count/app/modules/home/home_screen.dart';
import 'package:tap_to_count/app/modules/new_counter/new_counter_binding.dart';
import 'package:tap_to_count/app/modules/new_counter/new_counter_screen.dart';
import 'package:tap_to_count/main_binding.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      bindings: [HomeBinding(), MainBinding()],
    ),
    GetPage(
      name: Routes.newCounter,
      page: () => const NewCounterScreen(),
      bindings: [NewCounterBinding()],
    ),
    GetPage(
      name: Routes.counterDetail,
      page: () => const CounterDetailScreen(),
      bindings: [CounterDetailBinding()],
    ),
  ];
}
