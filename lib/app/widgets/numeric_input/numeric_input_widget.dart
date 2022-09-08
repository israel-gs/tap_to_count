import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tap_to_count/core/theme/colors.dart';

class NumericInputWidget extends StatefulWidget {
  final double min;
  final double? max;
  final double? currentValue;
  final double step;
  final Function(double value)? onChanged;
  final bool enableInput;

  const NumericInputWidget({
    Key? key,
    this.min = 0,
    this.max,
    this.currentValue = 0,
    this.step = 1,
    this.onChanged,
    this.enableInput = false,
  }) : super(key: key);

  @override
  State<NumericInputWidget> createState() => _NumericInputWidgetState();
}

class _NumericInputWidgetState extends State<NumericInputWidget> {
  late double _value;
  final _valueController = TextEditingController();
  final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

  @override
  initState() {
    _setFirstValue();
    super.initState();
  }

  _setFirstValue() {
    double min = widget.min;
    double max = widget.max ?? double.infinity;
    _value = widget.currentValue ?? 0;
    if (_value < min) {
      _value = min;
    }
    if (widget.max != null && _value > max) {
      _value = max;
    }
    _valueController.text = _value.toString().replaceAll(regex, '');
  }

  _onIncrement(double step) {
    double max = widget.max ?? double.infinity;
    setState(() {
      _value = _value + step;
      if (widget.max != null && _value > max) {
        _value = max;
      }
    });
    _valueController.text = _value.toString().replaceAll(regex, '');
    widget.onChanged?.call(_value);
  }

  _onDecrement(double step) {
    double min = widget.min;
    setState(() {
      _value = _value - step;
      if (_value < min) {
        _value = min;
      }
    });
    _valueController.text = _value.toString().replaceAll(regex, '');
    widget.onChanged?.call(_value);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: secondaryDarkBackgroundColor,
      shape: const CircleBorder(),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: buttonStyle,
          onPressed: () => _onDecrement(widget.step),
          onLongPress: () => _onDecrement(5),
          child: const FaIcon(
            FontAwesomeIcons.minus,
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _valueController,
            enabled: widget.enableInput,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
            ],
            style: TextStyle(
              fontSize: 60,
              color: theme.textTheme.labelMedium?.color,
            ),
            decoration: const InputDecoration(
              filled: false,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        ElevatedButton(
          style: buttonStyle,
          onPressed: () => _onIncrement(widget.step),
          onLongPress: () => _onIncrement(5),
          child: const FaIcon(
            FontAwesomeIcons.plus,
          ),
        ),
      ],
    );
  }
}
