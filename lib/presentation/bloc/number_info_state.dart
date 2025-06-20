import 'package:equatable/equatable.dart';
import '../../domain/entities/number_info.dart';

abstract class NumberInfoState extends Equatable {
  const NumberInfoState();

  @override
  List<Object?> get props => [];
}

class NumberInfoInitial extends NumberInfoState {}

class NumberInfoLoading extends NumberInfoState {}

class NumberInfoLoaded extends NumberInfoState {
  final NumberInfo info;

  const NumberInfoLoaded(this.info);

  @override
  List<Object?> get props => [info];
}

class NumberInfoError extends NumberInfoState {
  final String message;

  const NumberInfoError(this.message);

  @override
  List<Object?> get props => [message];
}

class SavedNumberInfoLoaded extends NumberInfoState {
  final List<NumberInfo> saved;

  const SavedNumberInfoLoaded(this.saved);

  @override
  List<Object?> get props => [saved];
} 