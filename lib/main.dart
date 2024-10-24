import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quran_book/presentation/pages/my_app.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  Locale defaultLocale = const Locale('uz', 'UZ');
  try {
    String languageCode = Platform.localeName.split('_')[0];
    if (languageCode == "ru") {
      defaultLocale = const Locale('ru', 'RU');
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://1a2131fd4d6582f88a72bee2004965cd@o4508097865318400.ingest.us.sentry.io/4508143617179648';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(SentryWidget(
        child: EasyLocalization(
      supportedLocales: const [Locale('uz', 'UZ'), Locale('ru', 'RU')],
      path: 'assets/lang',
      startLocale: defaultLocale,
      fallbackLocale: const Locale('uz', 'UZ'),
      child: const MyApp(),
    ))),
  );
}
