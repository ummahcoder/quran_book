import 'package:go_router/go_router.dart';
import 'package:quran_book/feature/auth/view/pages/sign_up.dart';
import 'package:quran_book/feature/splash/splash_screen.dart';

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
  ]);
}
