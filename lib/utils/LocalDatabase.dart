import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._internal();
  factory LocalDatabase() => _instance;
  static Database? _database;

  LocalDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'app_data.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE data (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT,
          isSynced INTEGER DEFAULT 0
        );
      ''');
    });
  }

  Future<void> insertData(String title, String content) async {
    final db = await database;
    await db.insert('data', {'title': title, 'content': content, 'isSynced': 0});
  }



  Future<List<Map<String, dynamic>>> fetchUnsyncedData() async {
    final db = await database;
    return await db.query('data', where: 'isSynced = ?', whereArgs: [0]);
  }



  Future<void> markAsSynced(int id) async {
    final db = await database;
    await db.update('data', {'isSynced': 1}, where: 'id = ?', whereArgs: [id]);


  }



  Future<List<Map<String, dynamic>>> fetchUnsyncedData1() async {
    final db = await database;
    return await db.query('data', where: 'isSynced = 0');


  }
}
