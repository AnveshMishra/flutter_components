part of 'app_colors.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  TextStyle? get bodySmall => textTheme.bodySmall;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  Color get textColor => colorScheme.getTextColor(
        brightness: read<ThemeProvider>().currentBrightness,
        theme: read<ThemeProvider>().currentAppTheme,
      );
  Color get borderColor => colorScheme.getBorderColor(
        brightness: read<ThemeProvider>().currentBrightness,
        theme: read<ThemeProvider>().currentAppTheme,
      );
  Color get dividerColor => colorScheme.getDividerColor(
        brightness: read<ThemeProvider>().currentBrightness,
        theme: read<ThemeProvider>().currentAppTheme,
      );
}

extension ColorSchemeExtension on ColorScheme {
  Color getTextColor(
          {Brightness? brightness = Brightness.light,
          AppTheme? theme = AppTheme.adani}) =>
      _textColor(brightness: brightness, theme: theme);
  Color getBorderColor(
          {Brightness? brightness = Brightness.light,
          AppTheme? theme = AppTheme.adani}) =>
      _borderColor(brightness: brightness, theme: theme);
  Color getDividerColor(
          {Brightness? brightness = Brightness.light,
          AppTheme? theme = AppTheme.adani}) =>
      _dividerColor(brightness: brightness, theme: theme);
}
