import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProgressBarPainter extends CustomPainter {
  final int progressValue;

  const MyProgressBarPainter({required this.progressValue});

  @override
  void paint(Canvas canvas, Size size) {
    final railPainter = Paint()
      ..strokeWidth = 5
      ..color = Colors.black26
      ..style = PaintingStyle.stroke;

    final progressPainter = Paint()
      ..strokeWidth = 5
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2.0, size.height / 2.0);

    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        0,
        pi * 2.0,
        false,
        railPainter);

    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        -pi / 2.0,
        pi * 2.0 * progressValue / 100.0,
        false,
        progressPainter);
  }

  @override
  bool shouldRepaint(covariant MyProgressBarPainter oldDelegate) {
    return progressValue != oldDelegate.progressValue;
  }
}
