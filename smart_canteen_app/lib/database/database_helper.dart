import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/food_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('canteen.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE foods (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      price REAL NOT NULL,
      image TEXT
    )
    ''');
    await db.execute('''
    CREATE TABLE cart (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      foodId INTEGER,
      quantity INTEGER
    )
    ''');
    await db.execute('''
    CREATE TABLE orders (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TEXT,
      total REAL
    )
    ''');
  }

  Future<int> insertFood(FoodModel food) async {
    final db = await instance.database;
    return await db.insert('foods', food.toMap());
  }

  Future<List<FoodModel>> getFoods() async {
    final db = await instance.database;
    final result = await db.query('foods');
    return result.map((json) => FoodModel.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}