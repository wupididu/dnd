import 'package:dnd/constants.dart';
import 'package:dnd/db/db.dart';
import 'package:dnd/logic/abstracts.dart';
import 'package:dnd/models/model.dart';
import 'package:dnd/models/model_class.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends AbstractAppCubit {
  DBProvider db = DBProvider.instance;

  AppCubit(String table) : super(AppState([]));

  @override
  Future<void> addModel(Model item, String name_of_table) async {
    await db.insert(name_of_table, item);
    List<Map<String, dynamic>> table = await db.query(name_of_table);
    emit(AppState(table));
  }

  @override
  Future<void> removeModel(Model item, String name_of_table) async {
    await db.delete(name_of_table, item);
    List<Map<String, dynamic>> table = await db.query(name_of_table);
    emit(AppState(table));
  }

  @override
  Future<void> getListOfModel(String name_of_table) async {
    List<Map<String, dynamic>> table = await db.query(name_of_table);
    emit(AppState(table));
  }

}