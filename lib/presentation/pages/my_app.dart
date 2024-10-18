import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_book/infrastructures/services/app_local.dart';
import 'package:quran_book/infrastructures/services/local_controller.dart';
import 'package:quran_book/infrastructures/services/local_db/inherited_local_notifer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_book/presentation/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedLocalNotifier(
      localController: localeController,
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp(
              onGenerateRoute: (_) {
                return AppRoutes.onGenerateRoute(
                  context: context,
                );
              },
              locale: InheritedLocalNotifier.maybeOf(context)?.appLocale ??
                  const Locale('ru', 'RU'),
              supportedLocales: const [
                Locale("uz", "UZ"),
                Locale("en", "US"),
                Locale("ru", "RU"),
              ],

              localizationsDelegates: const [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              // routerConfig: AppGouter.routeConfig,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: GoogleFonts.poppinsTextTheme(),
              ),
            );
          }),
    );
  }
}
