import 'package:get_it/get_it.dart';
import 'package:zoho_clone/features/zoho_clone/data/data_sources/zoho_remote_data_source.dart';
import 'package:zoho_clone/features/zoho_clone/data/repositories/zoho_repository_impl.dart';
import 'package:zoho_clone/features/zoho_clone/domain/repositories/zoho_repository.dart';
import 'package:zoho_clone/features/zoho_clone/domain/usecases/get_check_in_time.dart';
import 'package:zoho_clone/features/zoho_clone/domain/usecases/get_check_out_time.dart';
import 'package:zoho_clone/features/zoho_clone/domain/usecases/post_check_in_time.dart';
import 'package:zoho_clone/features/zoho_clone/domain/usecases/post_check_out_time.dart';
import 'package:zoho_clone/features/zoho_clone/presentation/pages/check_in_check_out/check_in_check_out_bloc/zoho_timer_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init()async {
  //* Features - ZohoClone
  // bloc
  sl.registerFactory(
    () => ZohoTimerBloc(
      getCheckInTimeUsecase: sl(),
      getCheckOutTimeUsecase: sl(),
      postCheckInTimeUsecase: sl(),
      postCheckOutTimeUsecase: sl(),
    ),
  );

  // usecases
  sl.registerLazySingleton(() => GetCheckInTimeUsecase(sl()));
  sl.registerLazySingleton(() => GetCheckOutTimeUsecase(sl()));
  sl.registerLazySingleton(() => PostCheckInTimeUsecase(sl()));
  sl.registerLazySingleton(() => PostCheckOutTimeUsecase(sl()));

  // repository
  sl.registerLazySingleton<ZohoRepository>(
      () => ZohoRepositoryImpl(remoteDataSource: sl()));

  // datasources
  sl.registerLazySingleton<ZohoRemoteDataSource>(
      () => ZohoRemoteDataSourceImpl(client: sl()));

  //* Core

  //* External
}
