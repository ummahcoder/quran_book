import 'package:flutter/material.dart';
import 'package:quran_book/presentation/pages/auth/view/pages/login_page.dart';
import 'package:quran_book/presentation/pages/auth/view/pages/sign_up.dart';
import 'package:quran_book/presentation/pages/auth/view/pages/verify_code.dart';
import 'package:quran_book/presentation/pages/home/view/pages/home_page.dart';
import 'package:quran_book/presentation/pages/home/zikr/zikr_page.dart';
import 'package:quran_book/presentation/pages/salah/salah_new_design.dart';
import 'package:quran_book/presentation/pages/splash/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute({required BuildContext context}) {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }

  static MaterialPageRoute getSalahTimesPage(BuildContext context) {
    return MaterialPageRoute(builder: (_) => const SalahNew());
  }

  static MaterialPageRoute getLoginPage({required BuildContext context}) {
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }

  static MaterialPageRoute getSignUpPage({required BuildContext context}) {
    return MaterialPageRoute(builder: (_) => const SignUpPage());
  }

  static MaterialPageRoute verifyCodePage({required BuildContext context}) {
    return MaterialPageRoute(builder: (_) => const VerifyCodePage());
  }

  static MaterialPageRoute getHomePage(BuildContext context) {
    return MaterialPageRoute(
      builder: (_) => const HomePage(),
    );
  }

  static MaterialPageRoute getZikrPage(BuildContext context) {
    return MaterialPageRoute(
      builder: (_) => const ZikrPage(),
    );
  }
}
