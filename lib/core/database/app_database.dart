import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starwars_clean_architecture/features/people/data/datasources/people_local_datasource.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'starwars.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(PeopleLocalDataSourceImpl.tableSql);
  }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
}
