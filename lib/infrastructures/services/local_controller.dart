import 'dart:developer';
import 'package:flutter/cupertino.dart';

enum Language { en, uz, ru }

final localeController = LocaleController();

class LocaleController with ChangeNotifier {
  String _appLocale = "en";

  Locale get appLocale => _appLocale == Language.uz.name
      ? const Locale("uz", "UZ")
      : _appLocale == Language.ru.name
          ? const Locale("ru", "RU")
          : const Locale("en", "US");

  void changeLang(Language language) {
    _appLocale = language.name;
    notifyListeners();
    log(_appLocale);
  }
}
