import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import '../modules/conversor_unidades/models/tipo_conversor.dart';

class DB {
  // Constructor privado
  DB._();

  // Instância única do banco de dados
  static final DB instance = DB._();

  // Banco de dados
  static Database? _database;

  // Getter para o banco de dados
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inicializa o banco de dados
  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'tools_app.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(_conversorUnidadesTable);
  }


  // Tabelas do banco de dados
  String get _conversorUnidadesTable => '''
  CREATE TABLE $tableName (
    $id INTEGER PRIMARY KEY AUTOINCREMENT,
    $valorOrigem TEXT NOT NULL,
    $tipoOrigem TEXT NOT NULL,
    $valorDestino TEXT NOT NULL,
    $tipoDestino TEXT NOT NULL
  );
''';

  static const String tableName = 'conversorUnidades';
  static const String id = 'id';
  static const String valorOrigem = 'valorOrigem';
  static const String tipoOrigem = 'tipoOrigem';
  static const String valorDestino = 'valorDestino';
  static const String tipoDestino = 'tipoDestino';

  static Map<String, dynamic> toMap(ConversorUnidadesModel unidades) {
    return {
      valorOrigem: unidades.valorOrigem,
      tipoOrigem: unidades.tipoOrigem,
      valorDestino: unidades.valorDestino,
      tipoDestino: unidades.tipoDestino,
    };
  }
}

class OperacaoUnidadesController {
  Future<void> insert(ConversorUnidadesModel unidades) async {
    final db = await DB.instance.database;
    final map = DB.toMap(unidades);

    await db.insert(
      DB.tableName,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ConversorUnidadesModel>> select() async {
    final db = await DB.instance.database;

    final List<Map<String, dynamic>> result = await db.query(DB.tableName);

    var list = <ConversorUnidadesModel>[];

    for (final item in result) {
      list.add(
        ConversorUnidadesModel(
          valorOrigem: item[DB.valorOrigem],
          tipoOrigem: item[DB.tipoOrigem],
          valorDestino: item[DB.valorDestino],
          tipoDestino: item[DB.tipoDestino],
        ),
      );
    }

    return list;
  }
}
