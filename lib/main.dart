import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/themes.dart';
import 'package:flutter/material.dart';

import 'home.dart';

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
          title: 'Flutter Demo', theme: adaniLightTheme, home: const Home());
    });
  }
}
