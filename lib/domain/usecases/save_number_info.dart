import '../entities/number_info.dart';
import '../repositories/number_info_repository.dart';

class SaveNumberInfo {
  final NumberInfoRepository repository;

  SaveNumberInfo(this.repository);

  Future<void> call(NumberInfo info) {
    return repository.saveNumberInfo(info);
  }
} 