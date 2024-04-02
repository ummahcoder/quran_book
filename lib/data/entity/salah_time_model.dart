import 'package:meta/meta.dart';
import 'dart:convert';

class NamozVaqtlari {
  String region;
  DateTime date;
  String weekday;
  HijriDate hijriDate;
  Times times;

  NamozVaqtlari({
    required this.region,
    required this.date,
    required this.weekday,
    required this.hijriDate,
    required this.times,
  });

  factory NamozVaqtlari.fromRawJson(String str) =>
      NamozVaqtlari.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NamozVaqtlari.fromJson(Map<String, dynamic> json) => NamozVaqtlari(
        region: json["region"],
        date: DateTime.parse(json["date"]),
        weekday: json["weekday"],
        hijriDate: HijriDate.fromJson(json["hijri_date"]),
        times: Times.fromJson(json["times"]),
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "weekday": weekday,
        "hijri_date": hijriDate.toJson(),
        "times": times.toJson(),
      };
}

class HijriDate {
  String month;
  int day;

  HijriDate({
    required this.month,
    required this.day,
  });

  factory HijriDate.fromRawJson(String str) =>
      HijriDate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HijriDate.fromJson(Map<String, dynamic> json) => HijriDate(
        month: json["month"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "day": day,
      };
}

class Times {
  String tongSaharlik;
  String quyosh;
  String peshin;
  String asr;
  String shomIftor;
  String hufton;

  Times({
    required this.tongSaharlik,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shomIftor,
    required this.hufton,
  });

  factory Times.fromRawJson(String str) => Times.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Times.fromJson(Map<String, dynamic> json) => Times(
        tongSaharlik: json["tong_saharlik"],
        quyosh: json["quyosh"],
        peshin: json["peshin"],
        asr: json["asr"],
        shomIftor: json["shom_iftor"],
        hufton: json["hufton"],
      );

  Map<String, dynamic> toJson() => {
        "tong_saharlik": tongSaharlik,
        "quyosh": quyosh,
        "peshin": peshin,
        "asr": asr,
        "shom_iftor": shomIftor,
        "hufton": hufton,
      };
}
