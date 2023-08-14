import 'package:api_client/setting_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_text_field.dart';
import 'base_bottom_sheer.dart';
import 'order_tracker.dart';
import 'otp/otp_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () => showAppBottomSheet(
                  context: context,
                  child: SettingList(masterList: const [
                    'City',
                    'Master',
                    'Material',
                    'Search',
                  ], selectedList: const [], onTap: (String value) {})),
              child: const Text('Open sheets'),
            ),
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
            const OtpView(
              totalOtpField: 6,
            ),
            const SizedBox(),
            ElevatedButton(
                onPressed: () => context.push('/page1'),
                child: const Text('Page1')),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
