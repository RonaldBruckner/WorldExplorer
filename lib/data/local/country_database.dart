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
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE countries (
        countryCode TEXT PRIMARY KEY,
        name TEXT,
        capital TEXT,
        population INTEGER,
        languages TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE currency_symbols (
        code TEXT PRIMARY KEY,
        name TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE country_currency (
        countryCode TEXT PRIMARY KEY,
        currencyCode TEXT
      )
    ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Add new tables without touching the existing countries table
          await db.execute('''
        CREATE TABLE currency_symbols (
          code TEXT PRIMARY KEY,
          name TEXT
        )
      ''');

          await db.execute('''
        CREATE TABLE country_currency (
          countryCode TEXT PRIMARY KEY,
          currencyCode TEXT
        )
      ''');
        }
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

  Future<void> saveCurrencyForCountry(String? countryCode, String currencyCode) async {
    final db = await database;
    await db.insert(
      'country_currency',
      {
        'countryCode': countryCode,
        'currencyCode': currencyCode,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> saveCurrencySymbols(Map<String, String> symbols) async {
    final db = await database;
    final batch = db.batch();

    for (final entry in symbols.entries) {
      batch.insert(
        'currency_symbols',
        {'code': entry.key, 'name': entry.value},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  Future<Map<String, String>> getCurrencySymbols() async {
    final db = await database;
    final result = await db.query('currency_symbols');

    return {
      for (var row in result)
        row['code'] as String: row['name'] as String,
    };
  }

  Future<String?> getCurrencyForCountry(String? countryCode) async {
    final db = await database;
    final result = await db.query(
      'country_currency',
      where: 'countryCode = ?',
      whereArgs: [countryCode],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first['currencyCode'] as String?;
    }

    return null;
  }

  Future<void> clear() async {
    final db = await database;
    await db.delete('countries');
  }
}
