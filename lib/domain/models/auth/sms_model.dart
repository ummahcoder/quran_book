// To parse this JSON data, do
//
//     final sendMassageModel = sendMassageModelFromJson(jsonString);

import 'dart:convert';

List<SendMassageModel> sendMassageModelFromJson(String str) =>
    List<SendMassageModel>.from(
        json.decode(str).map((x) => SendMassageModel.fromJson(x)));

String sendMassageModelToJson(List<SendMassageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SendMassageModel {
  final int mobilePhone;
  final String message;
  final int from;

  SendMassageModel({
    required this.mobilePhone,
    required this.message,
    required this.from,
  });

  factory SendMassageModel.fromJson(Map<String, dynamic> json) =>
      SendMassageModel(
        mobilePhone: json["mobile_phone"],
        message: json["message"],
        from: json["from"],
      );

  Map<String, dynamic> toJson() => {
        "mobile_phone": mobilePhone,
        "message": message,
        "from": from,
      };
}
