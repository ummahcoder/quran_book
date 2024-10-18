// import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:orient_motors/domain/models/filter/filter.dart';

// import '../../../domain/common/token.dart';

// class DBService {
//   static const _dbName = 'localDB';
//   static const _accessToken = 'access_token';
//   static const _refreshToken = 'refresh_token';
//   static const _themeMode = 'theme_mode';
//   static const _language = 'language';
//   static const _likesList = "likes_list";

//   static Box? _box;

//   DBService._();

//   static Future<DBService> get create async {
//     _box ??= await Hive.openBox(_dbName);
//     return DBService._();
//   }

//   /// Token
//   Future<void> setToken(Token token) async {
//     await _box?.put(_accessToken, token.accessToken ?? '');
//     await _box?.put(_refreshToken, token.refreshToken ?? '');
//   }

//   Token get token {
//     final accessToken = _box?.get(_accessToken);
//     final refreshToken = _box?.get(_refreshToken);
//     return Token(accessToken: accessToken, refreshToken: refreshToken);
//   }

//   // Likes
//   List<ResultsModel> get likesList {
//     final data = _box?.get(_likesList);
//     List<ResultsModel> result = ((data as List?)?.map((data) => ResultsModel.fromJson(data)) ?? []).toList();

//     return result;
//   }

//   static List<ResultsModel> likesListGlobal(Box? box) {
//     final data = box?.get(_likesList);
//     List<ResultsModel> result = ((data as List?)?.map((data) => ResultsModel.fromJson(data)) ?? []).toList();

//     return result;
//   }

//   Future<void> addLike(ResultsModel model) async {
//     if (!likesList.map((e) => e.id).contains(model.id)) {
//       await _box?.put(_likesList, [...likesList.map((e) => e.toJson()), model.toJson()]);
//     }
//   }

//   Future<void> removeLike(ResultsModel model) async {
//     if (likesList.map((e) => e.id).contains(model.id)) {
//       // dprint
//       final list = likesList;
//       list.remove(model);
//       await _box?.put(_likesList, list.map((e) => e.toJson()).toList());
//     }
//   }

//   Future<void> removeLikes() async {
//     await _box?.delete(_likesList);
//   }

//   /// Name
//   Future<void> setName(String? name) async {
//     await _box?.put(name, name ?? '');
//   }

//   /// Name
//   Future<void> setThemeMode(String? mode) async {
//     await _box?.put(_themeMode, mode);
//   }

//   String? get getThemeMode {
//     String? getName = _box?.get(_themeMode);
//     return getName;
//   }

//   Future<void> signOut() async {
//     bool? langSaved = getLang;
//     await _box?.clear();
//     setLang(isSaved: langSaved ?? false);
//   }

//   /// Lang
//   Future<void> setLang({bool isSaved = false}) async {
//     await _box?.put(_language, isSaved);
//   }

//   static ValueListenable<Box> listenable() {
//     return Hive.box(_dbName).listenable();
//   }

//   bool? get getLang {
//     bool? language = _box?.get(_language, defaultValue: false);

//     return language;
//   }
// }
