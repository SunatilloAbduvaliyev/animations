import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class TaskFourScreen extends StatefulWidget {
  const TaskFourScreen({super.key});

  @override
  State<TaskFourScreen> createState() => _TaskFourScreenState();
}

class _TaskFourScreenState extends State<TaskFourScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Container(
            width: 300,
            height: 200,
            color: Colors.blue, // Blue background
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2 - 50;
    final Paint paint = Paint()
      ..color = Colors.red // Red line
      ..strokeWidth = 10;
    final Paint paintWhite = Paint()
      ..color = Colors.white // Red line
      ..strokeWidth = 60;

    final Paint greenPaint = Paint()
      ..color = Colors.green // Green line
      ..strokeWidth = 60;
    final smilePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    canvas.drawLine(
      Offset(size.width /900, size.height / 3.10), // start point
      Offset(size.width * 4 / 4, size.height / 3.10), // end point
      paint,
    );
    canvas.drawLine(
      Offset(size.width /900, size.height / 2), // start point
      Offset(size.width * 4 / 4, size.height / 2), // end point
      paintWhite,
    );
    // Red line
    canvas.drawLine(
      Offset(size.width /900, size.height / 1.48), // start point
      Offset(size.width * 4 / 4, size.height / 1.48), // end point
      paint,
    );

    // Green line
    canvas.drawLine(
      Offset(size.width * 0 /4, size.height * 3.4 / 4), // start point
      Offset(size.width * 4 / 4, size.height * 3.4 /4), // end point
      greenPaint,
    );
    canvas.drawArc(
      Rect.fromCenter(
          center: const Offset(50, 30), width:radius , height: radius),
      1.6,
      pi ,
      false,
      smilePaint,
    );
    const star = [
      Offset(80, 5),
      Offset(68, 15),
      Offset(80, 5),
      Offset(88, 15),
      Offset(88, 15),
      Offset(80, 25),
      Offset(80, 25),
      Offset(78, 17),
      Offset(78, 17),
      Offset(70, 25),
      Offset(70, 25),
      Offset(68, 15),


      Offset(70, 25),
      // Offset(80, 10),
      // Offset(70, 15),
      // Offset(85, 15),
      // Offset(80, 25),
      // Offset(70, 25),
    ];
    final paints = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, star, paints);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
