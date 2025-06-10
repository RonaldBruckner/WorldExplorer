import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../models/country.dart';

class CountryDatabase {
  static final CountryDatabase _instance = CountryDatabase._internal();
  static Database? _database;

  CountryDatabase._internal();

  factory CountryDatabase() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'countries.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE countries (
            countryCode TEXT PRIMARY KEY,
            name TEXT,
            capital TEXT,
            population INTEGER,
            languages TEXT
          )
        ''');
      },
    );
  }


  Future deleteAndInitDb() async {
    final db = await database;
    await db.execute('DROP TABLE IF EXISTS countries');
    await db.execute('''
      CREATE TABLE countries (
        countryCode TEXT PRIMARY KEY,
        name TEXT,
        capital TEXT,
        population INTEGER,
        languages TEXT
      )
    ''');
  }

  Future<Country?> getCountryByCode(String? countryCode) async {
    final db = await database;
    final maps = await db.query(
      'countries',
      where: 'countryCode = ?',
      whereArgs: [countryCode],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return Country.fromMap(maps.first);
    }
    return null;
  }

  Future<void> saveCountry(Country? country) async {
    final db = await database;
    await db.insert(
      'countries',
      country!.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> clear() async {
    final db = await database;
    await db.delete('countries');
  }
}
