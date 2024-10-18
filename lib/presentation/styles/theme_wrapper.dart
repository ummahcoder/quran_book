import 'package:flutter/material.dart';
import 'package:quran_book/presentation/styles/colors.dart';
import 'package:quran_book/presentation/styles/fonts_style.dart';
import 'package:quran_book/presentation/styles/icon_set.dart';
import 'package:quran_book/presentation/styles/theme_controller.dart';

class ThemeWrapper {
  final ThemeController controller;
  final AppColors colors;
  final AppIcons icons;
  final AppFonts fonts;

  ThemeWrapper({
    required this.controller,
    required this.colors,
    required this.icons,
    required this.fonts,
  });

  static ThemeWrapper of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedThemeWrapper>()
            as _InheritedThemeWrapper)
        .themeWrapper;
  }
}

class ThemeProvider extends StatefulWidget {
  final Widget child;
  final ThemeWrapper themeWrapper;

  const ThemeProvider(
      {super.key, required this.child, required this.themeWrapper});

  @override
  // ignore: library_private_types_in_public_api
  _ThemeProviderState createState() => _ThemeProviderState();
}

class _ThemeProviderState extends State<ThemeProvider> {
  @override
  Widget build(BuildContext context) {
    return _InheritedThemeWrapper(
      themeWrapper: widget.themeWrapper,
      child: widget.child,
    );
  }
}

class _InheritedThemeWrapper extends InheritedWidget {
  final ThemeWrapper themeWrapper;

  const _InheritedThemeWrapper({
    required super.child,
    required this.themeWrapper,
  });

  @override
  bool updateShouldNotify(_InheritedThemeWrapper oldWidget) {
    return themeWrapper.controller.isDarkMode !=
        oldWidget.themeWrapper.controller.isDarkMode;
  }
}
