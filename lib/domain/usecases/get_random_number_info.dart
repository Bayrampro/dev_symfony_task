import '../entities/number_info.dart';
import '../repositories/number_info_repository.dart';

class GetRandomNumberInfo {
  final NumberInfoRepository repository;

  GetRandomNumberInfo(this.repository);

  Future<NumberInfo> call({required String type}) {
    return repository.getRandomNumberInfo(type: type);
  }
} 