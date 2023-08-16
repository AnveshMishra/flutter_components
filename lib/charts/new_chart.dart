import 'package:flutter/material.dart';

import 'custom_painter.dart';

class GraphScreen extends StatelessWidget {
  final List<double> barData = [20, 50, 80, 30, 70];
  final List<double> lineData = [20, 60, 90, 35, 80];

  GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: GraphPainter(barData: barData, data: barData),
        ),
      ),
    );
  }
}
