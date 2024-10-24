import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImages {
  final String splashImage;
  final String googleIcon;
  final String appBarSearch;
  final String linearContainer;
  final String appbarMenu;
  final String readIcon;
  final String quranBook;
  final String vaqf;
  final String tajweed;
  final String light;
  final String prayer;
  final String dua;
  final String save;

  AppImages._({
    required this.splashImage,
    required this.googleIcon,
    required this.appBarSearch,
    required this.linearContainer,
    required this.appbarMenu,
    required this.readIcon,
    required this.quranBook,
    required this.vaqf,
    required this.tajweed,
    required this.light,
    required this.prayer,
    required this.dua,
    required this.save,
  });

  static AppImages get create {
    return AppImages._(
      splashImage: "assets/images/splash_new.png",
      googleIcon: "assets/images/google.png",
      appBarSearch: "assets/images/search.png",
      linearContainer: "assets/images/fully.png",
      appbarMenu: "assets/images/menu.png",
      readIcon: "assets/images/read_icon.png",
      quranBook: "assets/images/quran.png",
      vaqf: "assets/images/vaqf.png",
      tajweed: "assets/images/tajweed.png",
      light: "assets/images/light.png",
      prayer: "assets/images/prayer.png",
      dua: "assets/images/dua.png",
      save: "assets/images/save.png",
    );
  }
}

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
    BoxFit? boxFit,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.cover,
    );
  }

  SvgPicture svgNetwork({
    Color? color,
    double? width,
    double? height,
    BoxFit? boxFit,
  }) {
    return SvgPicture.network(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.cover,
    );
  }
}
