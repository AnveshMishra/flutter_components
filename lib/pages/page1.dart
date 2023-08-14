import 'package:api_client/app_text_field.dart';
import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  context.read<ThemeProvider>().changeTheme(AppTheme.acc),
              child: const Text('acc'),
            ),
            ElevatedButton(
              onPressed: () =>
                  context.read<ThemeProvider>().changeTheme(AppTheme.ambuja),
              child: const Text('ambuja'),
            ),
            ElevatedButton(
              onPressed: () =>
                  context.read<ThemeProvider>().changeTheme(AppTheme.adani),
              child: const Text('adani'),
            ),
            AppTextField(
              label: 'Hello, world',
              controller: _controller,
            ).paddingAllSide(8.sp),
            ElevatedButton(
              onPressed: () => context.read<ThemeProvider>().toggleBrightness(),
              child: const Text('toggleBrightness'),
            ),
          ],
        ),
      ),
    );
  }
}
