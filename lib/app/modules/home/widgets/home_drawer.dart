import 'package:flutter/material.dart';
import 'package:tap_to_count/app/widgets/theme_switch/theme_switch_widget.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ThemeSwitchWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
