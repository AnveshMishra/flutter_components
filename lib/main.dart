import 'package:flutter/material.dart';

import 'order_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18),
        ),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.red,
            onPrimary: Colors.black,
            secondary: Colors.green,
            onSecondary: Colors.pink,
            error: Colors.purple,
            onError: Colors.purple,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Colors.cyanAccent,
            onSurface: Colors.yellow),
        useMaterial3: false,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: OrderTracker(
              orders: [
                Order(
                    title: 'Order Placed',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 1),
                Order(
                    title: 'Order Placed',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 1),
                Order(
                    title: 'Order Placed',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 1),
                Order(
                    title: 'Order Placed',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 1),
                Order(
                    title: 'Order Placed',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 0),
                Order(
                    title: 'Order Placed',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 0),
                Order(
                    title: 'Order Placed',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 0),
                Order(
                    title: 'Order Confirmed',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 0),
                Order(
                    title: 'Order dispatched',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 0),
                Order(
                    title: 'Order delivered',
                    subtitle: '12/12/2023 9:00 AM',
                    progress: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
