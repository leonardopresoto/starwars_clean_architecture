
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'features/films/data/datasources/films_local_datasource.dart';
import 'features/films/data/datasources/films_remote_datasource.dart';
import 'features/films/data/repositories/films_repository_impl.dart';
import 'features/films/domain/repositories/films_repository.dart';
import 'features/films/domain/usecases/get_films.dart';
import 'features/films/presentation/bloc/films_bloc.dart';
import 'features/people/data/datasources/people_local_datasource.dart';
import 'features/people/data/datasources/people_remote_datasource.dart';
import 'features/people/data/repositories/people_repository_impl.dart';
import 'features/people/domain/repositories/people_repository.dart';
import 'features/people/domain/usecases/get_people.dart';
import 'features/people/presentation/bloc/people_bloc.dart';
import 'features/planets/data/datasources/planets_local_datasource.dart';
import 'features/planets/data/datasources/planets_remote_datasource.dart';
import 'features/planets/data/repositories/planets_repository_impl.dart';
import 'features/planets/domain/repositories/planets_repository.dart';
import 'features/planets/domain/usecases/get_planets.dart';
import 'features/planets/presentation/bloc/planets_bloc.dart';
import 'features/species/data/datasources/species_local_datasource.dart';
import 'features/species/data/datasources/species_remote_datasource.dart';
import 'features/species/data/repositories/species_repository_impl.dart';
import 'features/species/domain/repositories/species_repository.dart';
import 'features/species/domain/usecases/get_species.dart';
import 'features/species/presentation/bloc/species_bloc.dart';
import 'features/starships/data/datasources/starships_local_datasource.dart';
import 'features/starships/data/datasources/starships_remote_datasource.dart';
import 'features/starships/data/repositories/starships_repository_impl.dart';
import 'features/starships/domain/repositories/starships_repository.dart';
import 'features/starships/domain/usecases/get_starships.dart';
import 'features/starships/presentation/bloc/starships_bloc.dart';
import 'features/vehicles/data/datasources/vehicles_local_datasource.dart';
import 'features/vehicles/data/datasources/vehicles_remote_datasource.dart';
import 'features/vehicles/data/repositories/vehicles_repository_impl.dart';
import 'features/vehicles/domain/repositories/vehicles_repository.dart';
import 'features/vehicles/domain/usecases/get_vehicles.dart';
import 'features/vehicles/presentation/bloc/vehicles_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - StarWars
  // Bloc
  sl.registerFactory(
    () => FilmsBloc(
      films: sl(),
    ),
  );
  sl.registerFactory(
    () => PeopleBloc(
      people: sl(),
    ),
  );
  sl.registerFactory(
    () => PlanetsBloc(
      planets: sl(),
    ),
  );
  sl.registerFactory(
    () => SpeciesBloc(
      species: sl(),
    ),
  );
  sl.registerFactory(
    () => StarshipsBloc(
      starships: sl(),
    ),
  );
  sl.registerFactory(
    () => VehiclesBloc(
      vehicles: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetFilms(sl()));
  sl.registerLazySingleton(() => GetPeople(sl()));
  sl.registerLazySingleton(() => GetPlanets(sl()));
  sl.registerLazySingleton(() => GetSpecies(sl()));
  sl.registerLazySingleton(() => GetStarships(sl()));
  sl.registerLazySingleton(() => GetVehicles(sl()));

  // Repository
  sl.registerLazySingleton<FilmsRepository>(
    () => FilmsRepositoryImpl(
      filmsLocalDataSource: sl(),
      networkInfo: sl(),
      filmsRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<PeopleRepository>(
    () => PeopleRepositoryImpl(
      peopleLocalDataSource: sl(),
      networkInfo: sl(),
      peopleRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<PlanetsRepository>(
    () => PlanetsRepositoryImpl(
      planetsLocalDataSource: sl(),
      networkInfo: sl(),
      planetsRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<SpeciesRepository>(
    () => SpeciesRepositoryImpl(
      speciesLocalDataSource: sl(),
      networkInfo: sl(),
      speciesRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<StarshipsRepository>(
    () => StarshipsRepositoryImpl(
      starshipsLocalDataSource: sl(),
      networkInfo: sl(),
      starshipsRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<VehiclesRepository>(
    () => VehiclesRepositoryImpl(
      vehiclesLocalDataSource: sl(),
      networkInfo: sl(),
      vehiclesRemoteDataSource: sl(),
    ),
  );

  // Data sources
  //Films
  sl.registerLazySingleton<FilmsRemoteDataSource>(
    () => FilmsRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<FilmsLocalDataSource>(
    () => FilmsLocalDataSourceImpl(),
  );
  //People
  sl.registerLazySingleton<PeopleRemoteDataSource>(
    () => PeopleRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<PeopleLocalDataSource>(
    () => PeopleLocalDataSourceImpl(),
  );
  //Planets
  sl.registerLazySingleton<PlanetsRemoteDataSource>(
    () => PlanetsRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<PlanetsLocalDataSource>(
    () => PlanetsLocalDataSourceImpl(),
  );
  //Species
  sl.registerLazySingleton<SpeciesRemoteDataSource>(
    () => SpeciesRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<SpeciesLocalDataSource>(
    () => SpeciesLocalDataSourceImpl(),
  );
  //Starships
  sl.registerLazySingleton<StarshipsRemoteDataSource>(
    () => StarshipsRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<StarshipsLocalDataSource>(
    () => StarshipsLocalDataSourceImpl(),
  );
  //Vehicles
  sl.registerLazySingleton<VehiclesRemoteDataSource>(
    () => VehiclesRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<VehiclesLocalDataSource>(
    () => VehiclesLocalDataSourceImpl(),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
