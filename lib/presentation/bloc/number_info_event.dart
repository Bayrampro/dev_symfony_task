import 'package:equatable/equatable.dart';
import '../../domain/entities/number_info.dart';

abstract class NumberInfoEvent extends Equatable {
  const NumberInfoEvent();

  @override
  List<Object?> get props => [];
}

class GetNumberInfoEvent extends NumberInfoEvent {
  final String input;
  final String type;

  const GetNumberInfoEvent({required this.input, required this.type});

  @override
  List<Object?> get props => [input, type];
}

class GetRandomNumberInfoEvent extends NumberInfoEvent {
  final String type;

  const GetRandomNumberInfoEvent({required this.type});

  @override
  List<Object?> get props => [type];
}

class LoadSavedNumberInfoEvent extends NumberInfoEvent {}

class SaveNumberInfoEvent extends NumberInfoEvent {
  final NumberInfo info;

  const SaveNumberInfoEvent(this.info);

  @override
  List<Object?> get props => [info];
} 