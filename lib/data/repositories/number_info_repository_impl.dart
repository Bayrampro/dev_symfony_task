import 'package:dev_symfony_task/domain/entities/number_info.dart';
import 'package:dev_symfony_task/domain/repositories/number_info_repository.dart';
import '../datasources/number_remote_data_source.dart';
import '../datasources/number_local_data_source.dart';
import '../models/number_info_model.dart';

class NumberInfoRepositoryImpl implements NumberInfoRepository {
  final NumberRemoteDataSource remoteDataSource;
  final NumberLocalDataSource localDataSource;

  NumberInfoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<NumberInfo> getNumberInfo({required int number, required String type}) async {
    try {
      final remoteInfo = await remoteDataSource.getNumberInfo(number: number, type: type);
      return remoteInfo;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NumberInfo> getRandomNumberInfo({required String type}) async {
    try {
      final remoteInfo = await remoteDataSource.getRandomNumberInfo(type: type);
      return remoteInfo;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<NumberInfo>> getSavedNumberInfo() async {
    return await localDataSource.getSavedNumberInfo();
  }

  @override
  Future<void> saveNumberInfo(NumberInfo info) async {
    if (info is NumberInfoModel) {
      await localDataSource.saveNumberInfo(info);
    } else {
      await localDataSource.saveNumberInfo(NumberInfoModel(
        text: info.text,
        number: info.number,
        type: info.type,
        savedAt: DateTime.now(),
      ));
    }
  }
} 