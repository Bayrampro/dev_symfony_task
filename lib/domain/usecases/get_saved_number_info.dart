import '../entities/number_info.dart';
import '../repositories/number_info_repository.dart';

class GetSavedNumberInfo {
  final NumberInfoRepository repository;

  GetSavedNumberInfo(this.repository);

  Future<List<NumberInfo>> call() {
    return repository.getSavedNumberInfo();
  }
} 