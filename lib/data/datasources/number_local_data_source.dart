import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/number_info_model.dart';

abstract interface class NumberLocalDataSource {
  Future<List<NumberInfoModel>> getSavedNumberInfo();
  Future<void> saveNumberInfo(NumberInfoModel info);
}

class NumberLocalDataSourceImpl implements NumberLocalDataSource {
  static const String cacheKey = 'CACHED_NUMBER_INFO';
  final SharedPreferences sharedPreferences;

  NumberLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<NumberInfoModel>> getSavedNumberInfo() async {
    final jsonString = sharedPreferences.getString(cacheKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => NumberInfoModel.fromLocal(e)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> saveNumberInfo(NumberInfoModel info) async {
    final currentList = await getSavedNumberInfo();
    final updatedList = [info.copyWith(savedAt: DateTime.now()), ...currentList];
    final jsonString = json.encode(updatedList.map((e) => e.toJson()).toList());
    await sharedPreferences.setString(cacheKey, jsonString);
  }
}

extension on NumberInfoModel {
  NumberInfoModel copyWith({DateTime? savedAt}) {
    return NumberInfoModel(
      text: text,
      number: number,
      type: type,
      savedAt: savedAt ?? this.savedAt,
    );
  }
} 