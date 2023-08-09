import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

// .SF UI Display
// Roboto

final _baseADLightTextStyle = TextStyle(
  color: adaniLightTextColor,
  fontSize: 22.sp,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
);

final adaniLightTheme = ThemeData(
  useMaterial3: true,
  dividerColor: adaniLightDividerColor,
  colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: adaniLightPrimaryColor,
      onPrimary: adaniLightBackGroundColor,
      secondary: adaniLightSecondaryColor,
      onSecondary: adaniLightBackGroundColor,
      error: errorColor,
      onError: adaniLightBackGroundColor,
      background: adaniLightBackGroundColor,
      onBackground: adaniLightTextColor,
      surface: adaniLightBackGroundColor,
      onSurface: adaniLightTextColor),
  textTheme: TextTheme(
    headlineLarge: _baseADLightTextStyle,
    headlineMedium: _baseADLightTextStyle.copyWith(
      fontSize: 18.sp,
    ),
    headlineSmall: _baseADLightTextStyle.copyWith(
      fontSize: 16.sp,
    ),
    bodyLarge: _baseADLightTextStyle.copyWith(
        fontSize: 18.sp, fontWeight: FontWeight.w400),
    bodyMedium: _baseADLightTextStyle.copyWith(
        fontSize: 16.sp, fontWeight: FontWeight.w400),
    bodySmall: _baseADLightTextStyle.copyWith(
        fontSize: 12.sp, fontWeight: FontWeight.w400),
  ),
);
