import 'package:sqflite/sqflite.dart';
import 'package:tap_to_count/app/data/models/counter_model.dart';

const String tableCounters = 'counters';
const String columnId = '_id';
const String columnColor = 'color';
const String columnTextColor = 'textColor';
const String columnValue = 'value';
const String columnName = 'name';
const String columnMaxValue = 'maxValue';
const String columnIncrement = 'increment';

class CounterProvider {
  late Database db;

  CounterProvider() {
    open('counters.db');
  }

  Future open(String path) async {
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db,
          int version,) async {
        await db.execute('''
          create table $tableCounters ( 
            $columnId integer primary key autoincrement, 
            $columnColor integer not null,
            $columnTextColor integer not null,
            $columnValue real not null,
            $columnName text not null,
            $columnMaxValue real,
            $columnIncrement real
          )
          ''');
      },
    );
  }

  Future<CounterModel> insert(CounterModel counter) async {
    counter.id = await db.insert(tableCounters, counter.toJson());
    return counter;
  }

  Future<CounterModel?> getCounter(int id) async {
    List<Map> maps = await db.query(
      tableCounters,
      columns: [
        columnId,
        columnColor,
        columnTextColor,
        columnValue,
        columnName,
        columnMaxValue,
        columnIncrement,
      ],
      where: '$columnId = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return CounterModel.fromJson(maps.first);
    }
    return null;
  }

  Future<List<CounterModel>> getCounters() async {
    List<Map> maps = await db.query(
      tableCounters,
      columns: [
        columnId,
        columnColor,
        columnTextColor,
        columnValue,
        columnName,
        columnMaxValue,
        columnIncrement,
      ],
    );
    return List.generate(maps.length, (i) {
      return CounterModel.fromJson(maps[i]);
    });
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableCounters,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(CounterModel counter) async {
    return await db.update(
      tableCounters,
      counter.toJson(),
      where: '$columnId = ?',
      whereArgs: [counter.id],
    );
  }

  Future close() async => db.close();
}
