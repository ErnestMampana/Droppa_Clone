import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalStorageService {
  static final _databaseName = "movethenation.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  LocalStorageService._privateConstructor();
  static final LocalStorageService instance =
      LocalStorageService._privateConstructor();

  // Only allow a single open connection to the database.
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    // return await openDatabase(path,
    //     version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  // Future _onCreate(Database db, int version) async {
  //   await db.execute('''
  //             CREATE TABLE ${RaceTable.tableName} (
  //               ${RaceTable.id} INTEGER PRIMARY KEY,
  //               ${RaceTable.userId} TEXT NOT NULL,
  //               ${RaceTable.raceSummary} TEXT NULL,
  //               ${RaceTable.raceId} TEXT NULL,
  //               ${RaceTable.maxSpeed} TEXT NULL,
  //               ${RaceTable.averageSpeed} TEXT NULL,
  //               ${RaceTable.distance} TEXT NULL,
  //               ${RaceTable.maxAltitude} TEXT NULL,
  //               ${RaceTable.minAltitude} TEXT NULL,
  //               ${RaceTable.startAltitude} TEXT NULL,
  //               ${RaceTable.finalAltitude} TEXT NULL,
  //               ${RaceTable.startTime} TEXT NULL,
  //               ${RaceTable.finishTime} TEXT NULL,
  //               ${RaceTable.pauseSeconds} TEXT NULL,
  //               ${RaceTable.totalSeconds} TEXT NULL,
  //               ${RaceTable.runSeconds} TEXT NULL,
  //               ${RaceTable.path} TEXT NULL,
  //               ${RaceTable.sessionType} TEXT NULL
  //             )
  //             ''');
  // }

  // Future<int> insert(Map<String, dynamic> race) async {
  //   Database db = await database;
  //   int id = await db.insert(RaceTable.tableName, race,
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   return id;
  // }

  // Future<List<RaceInfo>> fetchRaces(String userId) async {
  //   Database db = await database;
  //   var maps = await db.query(RaceTable.tableName,
  //       columns: [
  //         RaceTable.id,
  //         RaceTable.userId,
  //         RaceTable.raceSummary,
  //         RaceTable.raceId,
  //         RaceTable.maxSpeed,
  //         RaceTable.averageSpeed,
  //         RaceTable.distance,
  //         RaceTable.maxAltitude,
  //         RaceTable.minAltitude,
  //         RaceTable.startAltitude,
  //         RaceTable.finalAltitude,
  //         RaceTable.startTime,
  //         RaceTable.finishTime,
  //         RaceTable.pauseSeconds,
  //         RaceTable.totalSeconds,
  //         RaceTable.runSeconds,
  //         RaceTable.path,
  //         RaceTable.sessionType,
  //       ],
  //       where: '${RaceTable.userId} = ?',
  //       whereArgs: [userId]);

  //   var races = maps.map((e) => RaceInfo.fromMap(e)).toList();
  //   return races.length > 0 ? races : null;
  // }
}