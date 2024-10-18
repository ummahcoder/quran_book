import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;
  AppLocalization(this.locale);

  late Map<String, String> _localizationValue;

  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;

  Future<AppLocalization> load() async {
    final String stringValue =
        await rootBundle.loadString("assets/lang/${locale.languageCode}.json");
    Map<String, dynamic> mappedJson =
        jsonDecode(stringValue) as Map<String, dynamic>;
    _localizationValue =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
    return this;
  }

  String tr(String key) => _localizationValue[key]!;

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) =>
      ["uz", "en", "ru"].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async =>
      SynchronousFuture<AppLocalization>(await AppLocalization(locale).load());

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}
