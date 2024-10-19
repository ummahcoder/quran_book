import 'package:flutter/material.dart';
import 'package:quran_book/presentation/pages/home/view/pages/home_page.dart';
import 'package:quran_book/presentation/pages/home/zikr/zikr_page.dart';
import 'package:quran_book/presentation/pages/salah/salah_new_design.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute({required BuildContext context}) {
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  static Route<dynamic>? getSalahTimePage({required BuildContext context}) {
    return MaterialPageRoute(builder: (_) => const SalahNew());
  }

  static Route<dynamic>? getZikrPage({required BuildContext context}) {
    return MaterialPageRoute(builder: (_) => const ZikrPage());
  }
}
