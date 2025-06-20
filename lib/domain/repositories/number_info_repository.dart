import '../entities/number_info.dart';

abstract interface class NumberInfoRepository {
  Future<NumberInfo> getNumberInfo({required int number, required String type});
  Future<NumberInfo> getRandomNumberInfo({required String type});
  Future<List<NumberInfo>> getSavedNumberInfo();
  Future<void> saveNumberInfo(NumberInfo info);
} 