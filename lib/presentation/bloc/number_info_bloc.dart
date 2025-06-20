import 'package:flutter_bloc/flutter_bloc.dart';
import 'number_info_event.dart';
import 'number_info_state.dart';
import '../../domain/usecases/get_number_info.dart';
import '../../domain/usecases/get_random_number_info.dart';
import '../../domain/usecases/get_saved_number_info.dart';
import '../../domain/usecases/save_number_info.dart';
import '../../core/utils/input_converter.dart';

class NumberInfoBloc extends Bloc<NumberInfoEvent, NumberInfoState> {
  final GetNumberInfo getNumberInfo;
  final GetRandomNumberInfo getRandomNumberInfo;
  final GetSavedNumberInfo getSavedNumberInfo;
  final SaveNumberInfo saveNumberInfo;
  final InputConverter inputConverter;

  NumberInfoBloc({
    required this.getNumberInfo,
    required this.getRandomNumberInfo,
    required this.getSavedNumberInfo,
    required this.saveNumberInfo,
    required this.inputConverter,
  }) : super(NumberInfoInitial()) {
    on<GetNumberInfoEvent>(_onGetNumberInfo);
    on<GetRandomNumberInfoEvent>(_onGetRandomNumberInfo);
    on<LoadSavedNumberInfoEvent>(_onLoadSavedNumberInfo);
    on<SaveNumberInfoEvent>(_onSaveNumberInfo);
  }

  Future<void> _onGetNumberInfo(GetNumberInfoEvent event, Emitter<NumberInfoState> emit) async {
    final inputEither = inputConverter.stringToUnsignedInteger(event.input);
    await inputEither.fold(
      (failure) async {
        emit(const NumberInfoError('Число должно быть в виде цифры'));
      },
      (number) async {
        emit(NumberInfoLoading());
        try {
          final info = await getNumberInfo(number: number, type: event.type);
          emit(NumberInfoLoaded(info));
        } catch (e) {
          emit(const NumberInfoError('Ошибка при получении данных'));
        }
      },
    );
  }

  Future<void> _onGetRandomNumberInfo(GetRandomNumberInfoEvent event, Emitter<NumberInfoState> emit) async {
    emit(NumberInfoLoading());
    try {
      final info = await getRandomNumberInfo(type: event.type);
      emit(NumberInfoLoaded(info));
    } catch (e) {
      emit(const NumberInfoError('Ошибка при получении данных'));
    }
  }

  Future<void> _onLoadSavedNumberInfo(LoadSavedNumberInfoEvent event, Emitter<NumberInfoState> emit) async {
    emit(NumberInfoLoading());
    try {
      final saved = await getSavedNumberInfo();
      emit(SavedNumberInfoLoaded(saved));
    } catch (e) {
      emit(const NumberInfoError('Ошибка при загрузке сохранённых данных'));
    }
  }

  Future<void> _onSaveNumberInfo(SaveNumberInfoEvent event, Emitter<NumberInfoState> emit) async {
    try {
      await saveNumberInfo(event.info);
      add(LoadSavedNumberInfoEvent());
    } catch (e) {
      emit(const NumberInfoError('Ошибка при сохранении'));
    }
  }
} 