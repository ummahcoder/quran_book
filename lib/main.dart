import 'package:flutter/material.dart';
import 'package:quran_book/feature/my_app.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://1a2131fd4d6582f88a72bee2004965cd@o4508097865318400.ingest.us.sentry.io/4508143617179648';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
}
