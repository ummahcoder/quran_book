import 'package:flutter/cupertino.dart';
import 'package:quran_book/infrastructures/services/app_local.dart';

extension MyWords on Words {
  String tr(BuildContext context) => AppLocalization.of(context).tr(name);
}

// ignore: constant_identifier_names
enum Words {
  splash_learn,
  get_started,
  en,
  ru,
  uz,
  signUp,
  detail,
  name,
  enter,
  email,
  pass,
  terms,
  have,
  login,
  emailEnter,
  password,
  google,
  loginPage,
  loginPass,
  haveAN
}
