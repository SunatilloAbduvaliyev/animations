import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskOneScreen extends StatefulWidget {
  const TaskOneScreen({super.key});

  @override
  State<TaskOneScreen> createState() => _TaskOneScreenState();
}

class _TaskOneScreenState extends State<TaskOneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Task One"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: CustomPaint(
                      size: const Size(200, 200),
                      painter: MyPainter(),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: CustomPaint(
                      size: const Size(200, 200),
                      painter: MyPainterTwo(),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rectOne = const Offset(50, 0) & const Size(100, 100);
    final radius = min(size.width, size.height) / 2 - 70;
    const startAngle = 0.0;
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final smilePaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    canvas.drawArc(rectOne, startAngle, 2 * pi, false, paint);
    canvas.drawArc(
      Rect.fromCenter(
          center: const Offset(100, 80), width: radius, height: radius),
      3.2,
      pi,
      false,
      smilePaint,
    );
    canvas.drawArc(
      Rect.fromCenter(
          center: const Offset(80, 15), width: radius, height: radius),
      0.8,
      pi / 2,
      false,
      smilePaint,
    );
    canvas.drawArc(
      Rect.fromCenter(
          center: const Offset(120, 15), width: radius, height: radius),
      0.8,
      pi / 2,
      false,
      smilePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MyPainterTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rectOne = const Offset(50, 0) & const Size(100, 100);
    Rect rectTwo = const Offset(75, 20) & const Size(10, 10);
    Rect rectThree = const Offset(113, 20) & const Size(10, 10);
    final radius = min(size.width, size.height) / 2 - 50;
    const startAngle = 0.0;
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final paintTwo = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;
    final smilePaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    canvas.drawArc(rectOne, startAngle, 2 * pi, false, paint);
    canvas.drawArc(rectTwo, startAngle, 2 * pi, false, paintTwo);
    canvas.drawArc(rectThree, startAngle, 2 * pi, false, paintTwo);
    canvas.drawArc(
      Rect.fromCenter(
          center: const Offset(100, 90), width: radius, height: radius),
      3.8,
      pi / 1.8,
      false,
      smilePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
