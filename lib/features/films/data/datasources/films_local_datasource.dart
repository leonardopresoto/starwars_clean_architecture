import 'package:sqflite/sqflite.dart';
import 'package:starwars_clean_architecture/core/database/app_database.dart';
import 'package:starwars_clean_architecture/features/films/data/models/films_model.dart';

abstract class FilmsLocalDataSource {
  /// Gets the cached [List<FilmModel>] in the local database
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<List<FilmModel>> getListOfFilms();

  Future<void> cacheListOfFilms(List<FilmModel> filmToCache);
}

class FilmsLocalDataSourceImpl implements FilmsLocalDataSource {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_height TEXT,'
      '$_mass TEXT,'
      '$_hairColor TEXT,'
      '$_skinColor TEXT,'
      '$_eyeColor TEXT,'
      '$_birthYear TEXT,'
      '$_gender TEXT,'
      '$_homeworld TEXT,'
      '$_films TEXT,'
      '$_vehicles TEXT,'
      '$_starships TEXT,'
      '$_species TEXT,'
      '$_url TEXT,'
      '$_image TEXT)';
  static const String _tableName = 'films';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _height = 'height';
  static const String _mass = 'mass';
  static const String _hairColor = 'hairColor';
  static const String _skinColor = 'skinColor';
  static const String _eyeColor = 'eyeColor';
  static const String _birthYear = 'birthDay';
  static const String _gender = 'gender';
  static const String _homeworld = 'homeworld';
  static const String _films = 'films';
  static const String _vehicles = 'vehicles';
  static const String _starships = 'starships';
  static const String _species = 'species';
  static const String _url = 'url';
  static const String _image = 'image';

  @override
  Future<void> cacheListOfFilms(List<FilmModel> filmToCache) {
    return insertListOfFilm(filmToCache);
  }

  @override
  Future<List<FilmModel>> getListOfFilms() {
    return selectFilms();
  }

  Future<List<FilmModel>> selectFilms() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    // return List.generate(maps.length, (i) {
    //   return FilmModel(
    //     id: maps[i][_id],
    //     name: maps[i][_name],
    //     height: maps[i][_height],
    //     mass: maps[i][_mass],
    //     hairColor: maps[i][_hairColor],
    //     skinColor: maps[i][_skinColor],
    //     eyeColor: maps[i][_eyeColor],
    //     birthYear: maps[i][_birthYear],
    //     gender: maps[i][_gender],
    //     homeworld: maps[i][_homeworld],
    //     films: maps[i][_films].toString().split(","),
    //     vehicles: maps[i][_vehicles].toString().split(","),
    //     species: maps[i][_species].toString().split(","),
    //     starships: maps[i][_starships].toString().split(","),
    //     url: maps[i][_url],
    //     image: maps[i][_image],
    //   );
    // });
  }

  Future<void> insertListOfFilm(List<FilmModel> listOfFilmModel) async {
    // Get a reference to the database.
    final Database db = await getDatabase();
    // ignore: unused_local_variable
    for (var film in listOfFilmModel) {
      return await db.insert(
        _tableName,
        Map(), //film.toMap();
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
