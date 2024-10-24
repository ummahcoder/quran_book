import 'package:dartz/dartz.dart';

class Token extends Tuple2<String?, String?> {
  String? get accessToken => value1;

  String? get refreshToken => value2;

  Token({required String? accessToken, required String? refreshToken})
      : super(accessToken, refreshToken);
}
