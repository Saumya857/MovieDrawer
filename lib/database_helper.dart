import 'dart:async';
import 'dart:core';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_database_example/model/movies.dart';

import 'models/movies.dart';
import 'package:movielist/widgets/item_widget.dart';

class MoviesDatabase {
  static final MoviesDatabase instance = MoviesDatabase._init();

  static Database? _database;

  MoviesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('movies.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableMovies ( 
  ${MoviesFields.id} $idType, 
  ${MoviesFields.name} $textType,
  ${MoviesFields.directorname} $textType,
  ${MoviesFields.image} $textType
  )
''');
  }

  Future<Movie> create(Movie movie) async {
    final db = await instance.database;

    final id = await db.insert(tableMovies, movie.toJson());
    return movie.copy(id: id);
  }

  Future<Movie> openMovie(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableMovies,
      columns: MoviesFields.values,
      where: '${MoviesFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Movie.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Movie>> openAllMovie() async {
    final db = await instance.database;

    final orderBy = '${MoviesFields.name} ASC';

    final result = await db.query(tableMovies, orderBy: orderBy);

    return result.map((json) => Movie.fromJson(json)).toList();
  }

  Future<int> update(Movie movie) async {
    final db = await instance.database;

    return db.update(
      tableMovies,
      movie.toJson(),
      where: '${MoviesFields.id} = ?',
      whereArgs: [movie.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableMovies,
      where: '${MoviesFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
