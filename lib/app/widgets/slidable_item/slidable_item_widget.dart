import 'package:flutter/material.dart';

class SlidableItemWidget extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback onTap;
  final Icon icon;

  const SlidableItemWidget({
    Key? key,
    required this.backgroundColor,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: backgroundColor,
            child: InkWell(
              onTap: onTap,
              child: Center(
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
