
import 'custom_theme_mode.dart';

extension CustomThemeModeX on CustomThemeMode {
  static const light = 'light';
  static const dark = 'dark';
  bool get isLight => this == CustomThemeMode.light;

  bool get isDark => this == CustomThemeMode.dark;

  String get toKey => toString().split('.')[1];

  static CustomThemeMode toValue(String key) {
    if (key == light) {
      return CustomThemeMode.light;
    } else {
      return CustomThemeMode.dark;
    }
  }
}
