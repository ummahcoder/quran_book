class ThemeController {
  bool isDarkMode;

  ThemeController({required this.isDarkMode});

  toggleTheme() {
    isDarkMode = !isDarkMode;
  }
}