import 'package:go_router/go_router.dart';
import 'package:quran_book/feature/auth/view/pages/login_page.dart';
import 'package:quran_book/feature/auth/view/pages/sign_up.dart';
import 'package:quran_book/feature/auth/view/pages/verify_code.dart';
import 'package:quran_book/feature/home/view/pages/home_page.dart';
import 'package:quran_book/feature/home/zikr/barcha_zikrlar.dart';
import 'package:quran_book/feature/home/zikr/tongi_zikrlar.dart';
import 'package:quran_book/feature/home/zikr/zikr_page.dart';
import 'package:quran_book/feature/salah/salah_new_design.dart';
import 'package:quran_book/feature/splash/view/splash_screen.dart';

class AppGouter {
  static GoRouter routeConfig = GoRouter(initialLocation: "/", routes: [
    GoRoute(
        path: "/",
        name: "splash-screen",
        builder: ((context, state) => const SplashScreen())),
    GoRoute(
        path: "/signUp",
        name: "signUp",
        builder: ((context, state) => const SignUp())),
    GoRoute(
      path: "/logIn",
      name: "login",
      builder: ((context, state) => const LoginPage()),
    ),
    GoRoute(
        path: "/homePage",
        name: "homePage",
        builder: ((context, state) => const HomePage()),
        routes: [
          GoRoute(
            path: "showSalahTime",
            name: "showSalahTime",
            builder: ((context, state) => const SalahNew()),
          ),
          GoRoute(
              path: "zikr",
              name: "zikrPage",
              builder: ((context, state) => const ZikrPage()),
              routes: [
                GoRoute(
                  path: "barchaZikr",
                  name: "barchaZikr",
                  builder: ((context, state) => const BarchaZikrlar()),
                ),
                GoRoute(
                  path: "tongiZikr",
                  name: "tongiZikr",
                  builder: ((context, state) => const TongiZikrlar()),
                ),
              ]),
        ]),
    GoRoute(
        path: "/verifyCode",
        name: "verify-code",
        builder: ((context, state) => const VerifyCode())),
  ]);
}
