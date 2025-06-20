import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/number_info_model.dart';

abstract interface class NumberRemoteDataSource {
  Future<NumberInfoModel> getNumberInfo({required int number, required String type});
  Future<NumberInfoModel> getRandomNumberInfo({required String type});
}

class NumberRemoteDataSourceImpl implements NumberRemoteDataSource {
  final http.Client client;

  NumberRemoteDataSourceImpl({required this.client});

  @override
  Future<NumberInfoModel> getNumberInfo({required int number, required String type}) async {
    final url = Uri.parse('http://numbersapi.com/$number/$type?json');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return NumberInfoModel.fromJson(json.decode(response.body), type);
    } else {
      throw Exception('Ошибка при получении данных с сервера');
    }
  }

  @override
  Future<NumberInfoModel> getRandomNumberInfo({required String type}) async {
    final url = Uri.parse('http://numbersapi.com/random/$type?json');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return NumberInfoModel.fromJson(json.decode(response.body), type);
    } else {
      throw Exception('Ошибка при получении данных с сервера');
    }
  }
} 