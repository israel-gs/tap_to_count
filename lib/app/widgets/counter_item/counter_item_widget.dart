import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tap_to_count/app/data/models/counter_model.dart';

final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

class CounterItemWidget extends StatefulWidget {
  final CounterModel counter;
  final Function(CounterModel)? onIncrement;
  final Function(CounterModel)? onTap;

  const CounterItemWidget({
    Key? key,
    required this.counter,
    this.onIncrement,
    this.onTap,
  }) : super(key: key);

  @override
  State<CounterItemWidget> createState() => _CounterItemWidgetState();
}

class _CounterItemWidgetState extends State<CounterItemWidget> {
  @override
  Widget build(BuildContext context) {
    double tempValue = widget.counter.value;
    var backgroundColor = widget.counter.color;
    var foregroundColor = widget.counter.textColor;
    TextStyle numberStyle = TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w600,
      color: Color(foregroundColor),
    );
    TextStyle titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(foregroundColor),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        color: Color(backgroundColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!(widget.counter);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(tempValue.toString().replaceAll(regex, ''),
                        style: numberStyle),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.counter.name, style: titleStyle),
                        widget.counter.maxValue != null
                            ? Text(
                                '${'counterMaxConnector'.tr} ${widget.counter.maxValue.toString().replaceAll(regex, '')}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(foregroundColor),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    )
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(backgroundColor),
                    shape: const CircleBorder(),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () {
                    double maxValue =
                        widget.counter.maxValue ?? double.infinity;
                    if (tempValue < maxValue) {
                      tempValue = tempValue + widget.counter.increment;
                      var newCounter = widget.counter;
                      newCounter.value = tempValue;
                      widget.onIncrement?.call(newCounter);
                    }
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.plus,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
