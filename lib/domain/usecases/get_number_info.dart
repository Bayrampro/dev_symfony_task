import '../entities/number_info.dart';
import '../repositories/number_info_repository.dart';

class GetNumberInfo {
  final NumberInfoRepository repository;

  GetNumberInfo(this.repository);

  Future<NumberInfo> call({required int number, required String type}) {
    return repository.getNumberInfo(number: number, type: type);
  }
} 