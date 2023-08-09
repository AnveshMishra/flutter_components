import 'package:api_client/app_text_field.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/themes.dart';
import 'package:flutter/material.dart';

import 'order_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig.init(constraints, context);
      return MaterialApp(
        title: 'Flutter Demo',
        theme: adaniLightTheme,
        home: Scaffold(
          body: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextField(
                    label: 'Enter your Name',
                    controller: TextEditingController(),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                ),
                Center(
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
