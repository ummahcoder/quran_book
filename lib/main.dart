import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_book/core/local/local_controller.dart';
import 'package:quran_book/core/route_service/go_router.dart';
import 'package:quran_book/core/services/inherited_local_notifer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/local/app_local.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedLocalNotifier(
      localController: localeController,
      child: Builder(builder: (context) {
        return MaterialApp.router(
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
          routerConfig: AppGouter.routeConfig,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
        );
      }),
    );
  }
}
