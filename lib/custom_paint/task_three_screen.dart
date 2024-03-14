import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskThreeScreen extends StatefulWidget {
  const TaskThreeScreen({super.key});

  @override
  State<TaskThreeScreen> createState() => _TaskThreeScreenState();
}

class _TaskThreeScreenState extends State<TaskThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Colors.grey,
        body: Center(
          child: CustomPaint(
            size: const Size(300, 300),
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}


// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 4
//       ..style = PaintingStyle.stroke;
//
//     final center1 = Offset(size.width / 1.9, size.height / 10);
//     final radius1 = size.width / 6;
//     canvas.drawCircle(center1, radius1, paint);
//
//     final center2 = Offset(size.width * 2.1/4, size.height / 2);
//     final radius2 = size.width / 4.1;
//     canvas.drawCircle(center2, radius2, paint);
//
//     final eyePaint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.fill;
//
//     final nose = Paint()
//       ..color = Colors.yellow
//       ..style = PaintingStyle.fill;
//
//     canvas.drawOval(Rect.fromCircle(center: center1.translate(-radius1 / 3, -radius1 / 3), radius: radius1 / 5), eyePaint);
//     canvas.drawOval(Rect.fromCircle(center: center1.translate(radius1 / 3, -radius1 / 3), radius: radius1 / 5), eyePaint);
//
//     canvas.drawOval(Rect.fromCircle(center: center2.translate(-radius2 /100, -radius2 / 1.5), radius: radius2 / 7), eyePaint);
//     canvas.drawOval(Rect.fromCircle(center: center2.translate(radius2 / 100, -radius2 / 3), radius: radius2 / 7), eyePaint);
//     canvas.drawOval(Rect.fromCircle(center: center2.translate(radius2 / 100, -radius2 / 600), radius: radius2 / 7), eyePaint);
//
//     final smilePaint = Paint()
//       ..color = Colors.orange
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 3;
//     canvas.drawArc(
//       Rect.fromCenter(
//           center: const Offset(160, 40), width: radius1, height: radius1),
//       0.6,
//       pi / 1.8,
//       false,
//       smilePaint,
//     );
//
//     final nosePath = Path()
//       ..moveTo(center1.dx, center1.dy)
//       ..lineTo(center1.dx - radius1 / 4, center1.dy + radius1 / 6)
//       ..lineTo(center1.dx + radius1 / 1, center1.dy + radius1 / 6)
//       ..close();
//     canvas.drawPath(nosePath, nose);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final center1 = Offset(size.width / 1.9, size.height / 10);
    final radius1 = size.width / 6;
    canvas.drawCircle(center1, radius1, paint);

    final center2 = Offset(size.width * 2.1 / 4, size.height / 2);
    final radius2 = size.width / 4.1;
    canvas.drawCircle(center2, radius2, paint);

    final eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final nose = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    canvas.drawOval(
        Rect.fromCircle(center: center1.translate(-radius1 / 3, -radius1 / 3), radius: radius1 / 5),
        eyePaint);
    canvas.drawOval(
        Rect.fromCircle(center: center1.translate(radius1 / 3, -radius1 / 3), radius: radius1 / 5),
        eyePaint);

    canvas.drawOval(
        Rect.fromCircle(center: center2.translate(-radius2 / 100, -radius2 / 1.5), radius: radius2 / 7),
        eyePaint);
    canvas.drawOval(
        Rect.fromCircle(center: center2.translate(radius2 / 100, -radius2 / 3), radius: radius2 / 7),
        eyePaint);
    canvas.drawOval(
        Rect.fromCircle(center: center2.translate(radius2 / 100, -radius2 / 600), radius: radius2 / 7),
        eyePaint);

    final smilePaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    canvas.drawArc(
      Rect.fromCenter(center: const Offset(160, 40), width: radius1, height: radius1),
      0.6,
      pi / 1.8,
      false,
      smilePaint,
    );

    final nosePath = Path()
      ..moveTo(center1.dx, center1.dy)
      ..lineTo(center1.dx - radius1 / 4, center1.dy + radius1 / 6)
      ..lineTo(center1.dx + radius1 / 1, center1.dy + radius1 / 6)
      ..close();
    canvas.drawPath(nosePath, nose);

    canvas.drawLine(center2.translate(radius2 / 1.2, -40), center1.translate(radius1 * 3, 20), paint); 
    canvas.drawLine(center2.translate(-radius2 / 1.2, -40), center1.translate(-radius1 * 3, 20), paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}





