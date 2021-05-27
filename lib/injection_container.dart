import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'features/people/data/datasources/people_local_datasource.dart';
import 'features/people/data/datasources/people_remote_datasource.dart';
import 'features/people/data/repositories/people_repository_impl.dart';
import 'features/people/domain/repositories/people_repository.dart';
import 'features/people/domain/usecases/get_people.dart';
import 'features/people/presentation/bloc/people_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => PeopleBloc(
      people: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetPeople(sl()));

  // Repository
  sl.registerLazySingleton<PeopleRepository>(
    () => PeopleRepositoryImpl(
      peopleLocalDataSource: sl(),
      networkInfo: sl(),
      peopleRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PeopleRemoteDataSource>(
    () => PeopleRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<PeopleLocalDataSource>(
    () => PeopleLocalDataSourceImpl(),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
