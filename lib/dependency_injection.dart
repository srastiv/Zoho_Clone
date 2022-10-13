import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
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

  sl.registerLazySingleton<http.Client>(() => http.Client());

  //* Core

  //* External
}






//GetIt is a service locator that allows you to create 
//interfaces and their implementations, and access those 
//implementations globally, anywhere in your app. Injectable 
//generates code that we would have otherwise written by using 
//annotations. This allows us to worry more about logic and 
//less about how we are going to access it.