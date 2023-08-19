import 'package:api_client/router/router.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, value, __) {
        return LayoutBuilder(builder: (context, constraints) {
          SizeConfig.init(constraints, context);
          final AppRoute route = AppRoute(false, false);
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            routerConfig: route.router,
            theme: value.getThemeData(),
          );
        });
      },
    );
  }
}
