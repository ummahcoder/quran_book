import 'package:hive/hive.dart';

extension MyBox on Box {
  Future<void> putMyString(String key, String? value) async {
    await put(key, _encrypt(value));
  }

  Future<String> getMyString(String key) async => _decrypt(await get(key));

  static const _key = "flutterDev";

  String _encrypt(String? text) {
    text = text ?? "";
    var s = "";
    for (int i = 0; i < text.length; i++) {
      s += "${text[i]}${_key[i % _key.length]}";
    }
    return _reverse(s);
  }

  String _decrypt(String? text) {
    text = _reverse(text ?? "");
    var s = "";

    for (int i = 0; i < text.length; i += 2) {
      s += text[i];
    }
    return s;
  }

  String _reverse(String text) {
    var s = "";
    for (int i = text.length - 1; i >= 0; i--) {
      s += text[i];
    }
    return s;
  }
}
