import 'package:dio/dio.dart';
import 'package:quran_book/domain/models/auth/sms_model.dart';

class SendSMS {
  static const baseURL = "http://notify.eskiz.uz/api/message/sms/send";
  static Dio dio = Dio();

  static postData({required SendMassageModel getsms}) async {
    await dio.post(baseURL,
        options: Options(headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTIyMjUyNzgsImlhdCI6MTcwOTYzMzI3OCwicm9sZSI6InRlc3QiLCJzaWduIjoiNDk2YjFkYjBhODJiZTE2ZGNmMjMxODJmZGVmYTg1YWQzMmI1ZDQxNDBlZTI2OGM2YzhiYzVkMTgwYjg4MzQwNiIsInN1YiI6IjY2NTQifQ.Bo7Q9lnYXeR_-WwbS5nrsiITlJzhuGvLqvWBBUkaECA"
        }));
  }
}
