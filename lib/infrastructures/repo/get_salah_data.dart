import 'package:dio/dio.dart';
import '../../domain/models/salah/salah_time_model.dart';

class GetSalahDataService {
  final Dio dio = Dio();
  String baseURL = "https://islomapi.uz/api/present/day?region=Toshkent";

  Future<NamozVaqtlari> fetchNamozVaqtlari(String apiUrl) async {
    try {
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        return NamozVaqtlari.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }
}
