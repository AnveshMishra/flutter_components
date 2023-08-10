part of 'app_colors.dart';

Color _primaryColor(
    {Brightness? brightness = Brightness.light,
    AppTheme? theme = AppTheme.adani}) {
  switch (theme) {
    case AppTheme.acc:
      return brightness == Brightness.light
          ? accLightPrimaryColor
          : accDarkPrimaryColor;
    case AppTheme.ambuja:
      return brightness == Brightness.light
          ? ambujaLightPrimaryColor
          : ambujaDarkPrimaryColor;
    case AppTheme.adani:
    default:
      return brightness == Brightness.light
          ? adaniLightPrimaryColor
          : adaniDarkPrimaryColor;
  }
}

Color _borderColor(
    {Brightness? brightness = Brightness.light,
    AppTheme? theme = AppTheme.adani}) {
  switch (theme) {
    case AppTheme.acc:
      return brightness == Brightness.light
          ? accLightBorderColor
          : accDarkBorderColor;
    case AppTheme.ambuja:
      return brightness == Brightness.light
          ? ambujaLightBorderColor
          : ambujaDarkBorderColor;
    case AppTheme.adani:
    default:
      return brightness == Brightness.light
          ? adaniLightPrimaryColor
          : adaniDarkPrimaryColor;
  }
}

Color _dividerColor(
    {Brightness? brightness = Brightness.light,
    AppTheme? theme = AppTheme.adani}) {
  switch (theme) {
    case AppTheme.acc:
      return brightness == Brightness.light
          ? accLightDividerColor
          : accDarkDividerColor;
    case AppTheme.ambuja:
      return brightness == Brightness.light
          ? ambujaLightDividerColor
          : ambujaDarkDividerColor;
    case AppTheme.adani:
    default:
      return brightness == Brightness.light
          ? adaniLightPrimaryColor
          : adaniDarkPrimaryColor;
  }
}

Color _secondaryColor(
    {Brightness? brightness = Brightness.light,
    AppTheme? theme = AppTheme.adani}) {
  switch (theme) {
    case AppTheme.acc:
      return brightness == Brightness.light
          ? accLightSecondaryColor
          : accDarkSecondaryColor;
    case AppTheme.ambuja:
      return brightness == Brightness.light
          ? ambujaLightSecondaryColor
          : ambujaDarkSecondaryColor;
    case AppTheme.adani:
    default:
      return brightness == Brightness.light
          ? adaniLightSecondaryColor
          : adaniLightSecondaryColor;
  }
}

Color _textColor(
    {Brightness? brightness = Brightness.light,
    AppTheme? theme = AppTheme.adani}) {
  switch (theme) {
    case AppTheme.acc:
      return brightness == Brightness.light
          ? accLightTextColor
          : accDarkTextColor;
    case AppTheme.ambuja:
      return brightness == Brightness.light
          ? ambujaLightTextColor
          : ambujaDarkTextColor;
    case AppTheme.adani:
    default:
      return brightness == Brightness.light
          ? adaniLightTextColor
          : adaniLightTextColor;
  }
}

Color _backgroundColor(
    {Brightness? brightness = Brightness.light,
    AppTheme? theme = AppTheme.adani}) {
  switch (theme) {
    case AppTheme.acc:
      return brightness == Brightness.light
          ? accLightBackGroundColor
          : accDarkBackGroundColor;
    case AppTheme.ambuja:
      return brightness == Brightness.light
          ? ambujaLightBackGroundColor
          : ambujaDarkBackGroundColor;
    case AppTheme.adani:
    default:
      return brightness == Brightness.light
          ? adaniLightBackGroundColor
          : adaniDarkBackGroundColor;
  }
}

Color _error() {
  return errorColor;
}

ThemeData getAppThemeData(
    {Brightness? brightness = Brightness.light,
    AppTheme? theme = AppTheme.adani}) {
  final baseTextStyle = TextStyle(
    color: _textColor(brightness: brightness, theme: theme),
    fontSize: 22.sp,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );
  return ThemeData(
    useMaterial3: false,
    dividerColor: adaniLightDividerColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36.sp),
          ),
        ),
      ),
    ),
    colorScheme: ColorScheme(
        brightness: brightness!,
        primary: _primaryColor(brightness: brightness, theme: theme),
        onPrimary: _backgroundColor(brightness: brightness, theme: theme),
        secondary: _secondaryColor(brightness: brightness, theme: theme),
        onSecondary: _backgroundColor(brightness: brightness, theme: theme),
        error: _error(),
        onError: _backgroundColor(brightness: brightness, theme: theme),
        background: _backgroundColor(brightness: brightness, theme: theme),
        onBackground: _textColor(brightness: brightness, theme: theme),
        surface: _backgroundColor(brightness: brightness, theme: theme),
        onSurface: _textColor(brightness: brightness, theme: theme)),
    textTheme: TextTheme(
      headlineLarge: baseTextStyle,
      headlineMedium: baseTextStyle.copyWith(
        fontSize: 18.sp,
      ),
      headlineSmall: baseTextStyle.copyWith(
        fontSize: 16.sp,
      ),
      bodyLarge:
          baseTextStyle.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400),
      bodyMedium:
          baseTextStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
      bodySmall:
          baseTextStyle.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
    ),
  );
}
