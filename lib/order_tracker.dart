import 'package:flutter/material.dart';

class Order {
  final String title;
  final String subtitle;
  final double progress;

  Order({
    required this.progress,
    required this.title,
    required this.subtitle,
  });
}

class OrderTracker extends StatelessWidget {
  final List<Order> orders;

  const OrderTracker({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final bool isLast = index == orders.length - 1;
        double lastStepProgress;
        if (orders.length > 1) {
          lastStepProgress = orders[orders.length - 2].progress == 1 ? 1 : 0;
        } else {
          lastStepProgress = order.progress;
        }
        return OrderStep(
          isFirst: index == 0,
          isLast: isLast,
          progress: isLast ? lastStepProgress : order.progress,
          title: order.title,
          subtitle: order.subtitle,
        );
      },
    );
  }
}

class OrderStep extends StatelessWidget {
  final String title;
  final double progress;
  final String subtitle;
  final bool isLast;
  final bool isFirst;

  const OrderStep({
    super.key,
    required this.progress,
    required this.title,
    required this.subtitle,
    required this.isLast,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
              child: Padding(
            padding: EdgeInsets.only(top: isFirst ? 8.0 : 8),
            child: _renderLine(Colors.green, progress, isLast),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(subtitle),
                  const SizedBox(
                    height: 32,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderLine(Color color, double progress, bool isLast) =>
      CustomVerticalLine(
        isLas: isLast,
        height: null,
        progress: progress,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
            ),
          ),
          height: 16,
          width: 16,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            height: 8,
            width: 8,
          ),
        ),
      );
}

class CustomVerticalLine extends StatelessWidget {
  final double? height;
  final double progress;
  final Widget child;
  final bool isLas;

  const CustomVerticalLine(
      {super.key,
      required this.height,
      required this.progress,
      required this.child,
      required this.isLas});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 60,
      child: CustomPaint(
        painter: VerticalLinePainter(progress, isLas),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: child,
          ),
        ),
      ),
    );
  }
}

class VerticalLinePainter extends CustomPainter {
  final double progress;
  final bool isLas;

  VerticalLinePainter(this.progress, this.isLas);

  @override
  void paint(Canvas canvas, Size size) {
    final double lineWidth = size.width;
    final double lineHeight = isLas ? 16 : size.height + 8;

    final Paint linePaint = Paint()
      ..color = progress == 0 ? Colors.red : Colors.green
      ..strokeWidth = 2.5;

    final double progressHeight = (lineHeight - 16) * progress;

    final Paint progressPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.5;

    // Draw the full line in black color
    canvas.drawLine(
        Offset(lineWidth / 2, 0), Offset(lineWidth / 2, lineHeight), linePaint);

    // Draw the partial line with the progress color
    if (progress != 1) {
      canvas.drawLine(Offset(lineWidth / 2, lineHeight),
          Offset(lineWidth / 2, lineHeight - progressHeight), progressPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
