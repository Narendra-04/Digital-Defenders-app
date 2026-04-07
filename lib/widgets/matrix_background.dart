import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class MatrixBackground extends StatefulWidget {
  const MatrixBackground({super.key});

  @override
  State<MatrixBackground> createState() => _MatrixBackgroundState();
}

class _MatrixBackgroundState extends State<MatrixBackground> {
  final random = Random();
  List<double> drops = List.generate(30, (_) => 0);

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        for (int i = 0; i < drops.length; i++) {
          drops[i] += 10;

          if (drops[i] > MediaQuery.of(context).size.height) {
            drops[i] = 0;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MatrixPainter(drops),
      size: Size.infinite,
    );
  }
}

class MatrixPainter extends CustomPainter {
  final List<double> drops;

  MatrixPainter(this.drops);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.green.withOpacity(0.6);

    for (int i = 0; i < drops.length; i++) {
      double x = i * 20;
      double y = drops[i];

      canvas.drawCircle(Offset(x, y), 3, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}