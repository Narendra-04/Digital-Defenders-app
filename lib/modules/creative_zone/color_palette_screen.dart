import 'package:flutter/material.dart';

class ColorPaletteScreen extends StatefulWidget {
  const ColorPaletteScreen({super.key});

  @override
  State<ColorPaletteScreen> createState() => _ColorPaletteScreenState();
}

class _ColorPaletteScreenState extends State<ColorPaletteScreen> {

  Color selected = Colors.green;

  final colors = [
    Colors.red, Colors.blue, Colors.green,
    Colors.yellow, Colors.orange, Colors.purple,
    Colors.pink, Colors.cyan, Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color Palette 🎨")),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: colors.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: () => setState(() => selected = colors[i]),
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colors[i],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selected == colors[i]
                      ? Colors.white
                      : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}