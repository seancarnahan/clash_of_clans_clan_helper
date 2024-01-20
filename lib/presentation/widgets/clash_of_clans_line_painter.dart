import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClashOfClansLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black54 // Color of the line
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Thickness of the line

    // Create a path for a wavy line
    var path = Path();
    path.moveTo(0, size.height / 2);
    for (double i = 0; i < size.width; i += 5) {
      path.lineTo(i, size.height / 2 + math.sin(i / 10) * 4);
    }

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ClashOfClansLinePainter oldDelegate) => false;
}
