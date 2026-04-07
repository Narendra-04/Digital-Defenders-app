import 'package:flutter/material.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({super.key});

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {

  List<DrawnLine> lines = [];
  Color selectedColor = Colors.greenAccent;
  double strokeWidth = 4.0;

  void addPoint(Offset point) {
    setState(() {
      lines.add(DrawnLine(
        points: [point],
        color: selectedColor,
        width: strokeWidth,
      ));
    });
  }

  void updatePoint(Offset point) {
    setState(() {
      lines.last.points.add(point);
    });
  }

  void undo() {
    if (lines.isNotEmpty) {
      setState(() => lines.removeLast());
    }
  }

  void clear() {
    setState(() => lines.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawing Board 🎨"),
        actions: [
          IconButton(onPressed: undo, icon: const Icon(Icons.undo)),
          IconButton(onPressed: clear, icon: const Icon(Icons.delete)),
        ],
      ),

      body: Column(
        children: [

          /// 🎨 Canvas
          Expanded(
            child: GestureDetector(
              onPanStart: (d) => addPoint(d.localPosition),
              onPanUpdate: (d) => updatePoint(d.localPosition),

              child: CustomPaint(
                painter: DrawingPainter(lines),
                size: Size.infinite,
              ),
            ),
          ),

          /// 🎚 Brush Size
          Slider(
            value: strokeWidth,
            min: 1,
            max: 10,
            onChanged: (val) {
              setState(() => strokeWidth = val);
            },
          ),

          /// 🎨 Color Palette
          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _color(Colors.greenAccent),
                _color(Colors.red),
                _color(Colors.blue),
                _color(Colors.yellow),
                _color(Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _color(Color color) {
    return GestureDetector(
      onTap: () => setState(() => selectedColor = color),
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedColor == color ? Colors.white : Colors.transparent,
            width: 3,
          ),
        ),
      ),
    );
  }
}

/// MODEL
class DrawnLine {
  List<Offset> points;
  Color color;
  double width;

  DrawnLine({
    required this.points,
    required this.color,
    required this.width,
  });
}

/// PAINTER
class DrawingPainter extends CustomPainter {
  final List<DrawnLine> lines;

  DrawingPainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    for (var line in lines) {
      final paint = Paint()
        ..color = line.color
        ..strokeWidth = line.width
        ..strokeCap = StrokeCap.round;

      for (int i = 0; i < line.points.length - 1; i++) {
        canvas.drawLine(line.points[i], line.points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}