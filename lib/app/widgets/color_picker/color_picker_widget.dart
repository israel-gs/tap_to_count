import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  final Function(Color)? onColorChanged;

  const ColorPickerWidget({Key? key, this.onColorChanged}) : super(key: key);

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  late List<MaterialColor> _randomColors;
  late Color _selectedColor;

  @override
  void initState() {
    List<MaterialColor> colors = [...Colors.primaries];
    colors.shuffle();
    _randomColors = colors.take(8).toList();
    setState(() {
      _selectedColor = _randomColors[0];
    });
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
