import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GraphPainter extends CustomPainter {
  final List<double> data;
  final List<double> barData;
  final double barWidth;
  final Color lineColor;
  final Color barColor;
  final Color jointColor;
  final Color dotColor;

  GraphPainter({
    required this.data,
    required this.barData,
    this.barWidth = 10.0,
    this.lineColor = Colors.blue,
    this.barColor = Colors.red,
    this.jointColor = Colors.black,
    this.dotColor = Colors.white,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double x, y;
    double maxValue = data.reduce(max);

    // Draw the bar graph
    for (int i = 0; i < barData.length; i++) {
      x = i * barWidth;
      y = size.height - (barData[i] / maxValue) * size.height;
      canvas.drawRect(Rect.fromLTWH(x, y, barWidth, size.height),
          Paint()..color = barColor);
    }

    // Draw the line graph
    Path path = Path();
    path.moveTo(0.0, size.height - (data[0] / maxValue) * size.height);
    for (int i = 1; i < data.length; i++) {
      x = i * barWidth;
      y = size.height - (data[i] / maxValue) * size.height;
      path.lineTo(x, y);
    }
    canvas.drawPath(path, Paint()..color = lineColor);

    // Draw the circular joints
    for (int i = 0; i < data.length; i++) {
      x = i * barWidth + barWidth / 2;
      y = size.height - (data[i] / maxValue) * size.height;
      canvas.drawCircle(Offset(x, y), 5.0, Paint()..color = jointColor);
      canvas.drawCircle(Offset(x, y), 2.0, Paint()..color = dotColor);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
