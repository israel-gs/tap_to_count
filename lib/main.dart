import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_to_count/app/data/services/counter/counter_service.dart';
import 'package:tap_to_count/core/theme/theme.dart';
import 'package:tap_to_count/main_binding.dart';
import 'package:tap_to_count/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => CounterService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tap To Count',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialBinding: MainBinding(),
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
