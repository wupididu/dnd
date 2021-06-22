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
  Future<void> addClass(ClassOfHero item) async {
    await db.insert(TABLE_CLASS, item);
    List<Map<String, dynamic>> table = await db.query(TABLE_CLASS);
    emit(AppState(table));
  }

  @override
  Future<void> removeClass(ClassOfHero item) async {
    await db.delete(TABLE_CLASS, item);
    List<Map<String, dynamic>> table = await db.query(TABLE_CLASS);
    emit(AppState(table));
  }

  @override
  Future<void> getListOfClass() async {
    List<Map<String, dynamic>> table = await db.query(TABLE_CLASS);
    emit(AppState(table));
  }

}