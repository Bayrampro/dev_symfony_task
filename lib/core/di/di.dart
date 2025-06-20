import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/datasources/number_local_data_source.dart';
import '../../data/datasources/number_remote_data_source.dart';
import '../../data/repositories/number_info_repository_impl.dart';
import '../../domain/usecases/get_number_info.dart';
import '../../domain/usecases/get_random_number_info.dart';
import '../../domain/usecases/get_saved_number_info.dart';
import '../../domain/usecases/save_number_info.dart';
import '../utils/input_converter.dart';
import '../../presentation/bloc/number_info_bloc.dart';
import '../../domain/repositories/number_info_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => NumberInfoBloc(
        getNumberInfo: sl(),
        getRandomNumberInfo: sl(),
        getSavedNumberInfo: sl(),
        saveNumberInfo: sl(),
        inputConverter: sl(),
      ));

  sl.registerLazySingleton(() => GetNumberInfo(sl()));
  sl.registerLazySingleton(() => GetRandomNumberInfo(sl()));
  sl.registerLazySingleton(() => GetSavedNumberInfo(sl()));
  sl.registerLazySingleton(() => SaveNumberInfo(sl()));


  sl.registerLazySingleton<NumberInfoRepository>(() => NumberInfoRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
      ));

  
  sl.registerLazySingleton<NumberRemoteDataSource>(
      () => NumberRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<NumberLocalDataSource>(
      () => NumberLocalDataSourceImpl(sharedPreferences: sl()));

  
  sl.registerLazySingleton(() => InputConverter());

 
  sl.registerLazySingleton(() => http.Client());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
} 
