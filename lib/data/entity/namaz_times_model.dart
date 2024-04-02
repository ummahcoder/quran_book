import 'package:meta/meta.dart';
import 'dart:convert';

class NamazTimes {
  String region;
  DateTime date;
  String weekday;
  Times times;

  NamazTimes({
    required this.region,
    required this.date,
    required this.weekday,
    required this.times,
  });

  factory NamazTimes.fromRawJson(String str) =>
      NamazTimes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NamazTimes.fromJson(Map<String, dynamic> json) => NamazTimes(
        region: json["region"],
        date: DateTime.parse(json["date"]),
        weekday: json["weekday"],
        times: Times.fromJson(json["times"]),
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "weekday": weekday,
        "times": times.toJson(),
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
