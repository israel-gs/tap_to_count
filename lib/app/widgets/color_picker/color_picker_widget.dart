import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  final Color? initialColor;
  final Function(Color)? onColorChanged;

  const ColorPickerWidget({
    Key? key,
    this.onColorChanged,
    this.initialColor,
  }) : super(key: key);

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  late List<Color> _randomColors;
  late Color _selectedColor;

  @override
  void initState() {
    List<Color> tempColors = [...Colors.primaries.map((e) => e[500] ?? e)];
    tempColors.shuffle();

    if (widget.initialColor != null) {
      tempColors = [
        widget.initialColor!,
        ...tempColors.where((e) => e != widget.initialColor)
      ];
      _selectedColor = widget.initialColor!;
    } else {
      _selectedColor = tempColors.first;
    }

    _randomColors = tempColors.take(8).toList();

    setState(() {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onColorChanged?.call(_selectedColor);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ..._randomColors
                .getRange(0, 4)
                .map((e) => _buildColorItem(e))
                .toList(),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ..._randomColors
                .getRange(4, 8)
                .map((e) => _buildColorItem(e))
                .toList(),
          ],
        )
      ],
    );
  }

  _buildColorItem(Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Material(
            borderRadius: BorderRadius.circular(5),
            color: color,
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedColor = color;
                });
                widget.onColorChanged?.call(color);
              },
              child: AnimatedContainer(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedColor == color
                        ? Colors.white70
                        : Colors.transparent,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                duration: const Duration(milliseconds: 150),
                child: Center(
                  child: AnimatedContainer(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: _selectedColor == color
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    duration: const Duration(
                      milliseconds: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
