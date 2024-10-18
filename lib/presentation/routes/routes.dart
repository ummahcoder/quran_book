import 'package:flutter/material.dart';
import 'package:quran_book/presentation/pages/home/view/pages/home_page.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute({
    required BuildContext context,
  }) {
    return MaterialPageRoute(
      builder: (_) => const HomePage(),
    );
  }
}
