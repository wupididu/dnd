import 'dart:async';
import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider instance = DBProvider._init();
  
  DBProvider._init();

  static Database? _db;

  static int get _version => 1;

  Future<Database> get database async {
    if (_db != null) return _db!;

    await init();
    return _db!;
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'database.db';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async =>
      await db.execute(_tableAbilityScores +
          _tableClass +
          _tableRace +
          _tableRaceSkills +
          _tableHero +
          _tableHeroSkills +
          _tableSpells +
          _tableItem +
          _tableWeapons);

  Future<List<Map<String, dynamic>>> query(String table) async {
    final _db = await instance.database;
    return _db.query(table);
  }

  Future<int> insert(String table, Model model) async {
    final _db = await instance.database;
    return await _db.insert(table, model.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(String table, Model model) async {
    final _db = await instance.database;
    return await _db.update(table, model.toMap(),
          where: '${model.ID} = ?', whereArgs: [model.id]);
  }

  Future<int> delete(String table, Model model) async {
    final _db = await instance.database;
    return await _db.delete(table, where: '${model.ID} = ?', whereArgs: [model.id]);
  }

  static String get _tableHero => """
    CREATE TABLE IF NOT EXISTS $TABLE_HERO (
      $HERO_ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      $HERO_NAME VARCHAR(255),
      $HERO_KD INTEGER,
      $HERO_HIT INTEGER,
      FOREIGN KEY($ABILITY_SCORES_ID) REFERENCES $TABLE_ABILITY_SCORES($ABILITY_SCORES_ID),
      FOREIGN KEY($CLASS_ID) REFERENCES $TABLE_CLASS($CLASS_ID),
      FOREIGN KEY($RACE_ID) REFERENCES $TABLE_RACE($RACE_ID),
    )
   """;

  static String get _tableHeroSkills => """
    CREATE TABLE IF NOT EXISTS $TABLE_HERO_SKILLS (
      $HERO_SKILLS_ID VARCHAR(255) NOT NULL PRIMARY KEY,
      $HERO_SKILLS_NAME VARCHAR(255),
      $HERO_SKILLS_DESC TEXT,
      $HERO_SKILLS_TYPE VARCHAR(255),
      $HERO_SKILLS_BONUS INTEGER,
      FOREIGN KEY($HERO_ID) REFERENCES $TABLE_HERO($HERO_ID),
    )
  """;

  static String get _tableSpells => """
    CREATE TABLE IF NOT EXISTS $TABLE_SPELLS (
      $SPELLS_ID TEXT NOT NULL PRIMARY KEY,
      $SPELLS_NAME VARCHAR(255),
      $SPELLS_DESC TEXT,
      $SPELLS_HIT_DICE INTEGER,
      $SPELLS_TYPE_DAMAGE VARCHAR(255),
      FOREIGN KEY($HERO_ID) REFERENCES $TABLE_HERO($HERO_ID),
    )
  """; // SpellsID = String(HeroID) + name

  static String get _tableItem => """
    CREATE TABLE IF NOT EXISTS $TABLE_ITEM (
      $ITEM_ID TEXT NOT NULL Primary KEY,
      $ITEM_NAME VARCHAR(255),
      $ITEM_DESC TEXT,
      FOREIGN KEY($HERO_ID) REFERENCES $TABLE_HERO($HERO_ID),
    )
  """;

  static String get _tableWeapons => """
    CREATE TABLE IF NOT EXISTS $TABLE_WEAPONS(
      $WEAPONS_ID VARCHAR(255) NOT NULL PRIMARY KEY,
      $WEAPONS_NAME VARCHAR(255),
      $WEAPONS_HIT_DICE VARCHAR(255),
      $WEAPONS_DESC TEXT,
      $WEAPONS_TYPE_DAMAGE VARCHAR(255),
      FOREIGN KEY($HERO_ID) REFERNCES $TABLE_HERO($HERO_ID),
    )
  """;

  static String get _tableAbilityScores => """
    CREATE TABLE IF NOT EXISTS $TABLE_ABILITY_SCORES{
      $ABILITY_SCORES_ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      $ABILITY_SCORES_STR INTEGER,
      $ABILITY_SCORES_DEX INTEGER,
      $ABILITY_SCORES_CON INTEGER,
      $ABILITY_SCORES_INT INTEGER,
      $ABILITY_SCORES_WIS INTEGER,
      $ABILITY_SCORES_CHA INTEGER, 
    }
  """;

  static String get _tableClass => """
    CREATE TABLE IF NOT EXISTS $TABLE_CLASS{
      $CLASS_ID VARCHAR(255) PRIMARY KEY NOT NULL,
      $CLASS_NAME VARCHAR(255),
      $CLASS_DESC TEXT,
      $CLASS_IMG_URL VARCHAR(255),
      $CLASS_HIT_DICE INTEGER,
      FOREIGN KEY($ABILITY_SCORES_ID) REFERNCES $TABLE_ABILITY_SCORES($ABILITY_SCORES_ID),
    }
  """;

  static String get _tableRace => """
    CREATE TABLE IF NOT EXISTS $TABLE_RACE{
      $RACE_ID VARCHAR(255) PRIMARY KEY NOT NULL,
      $RACE_NAME VARCHAR(255),
      $RACE_DESC TEXT,
      $RACE_IMG_URL VARCHAR(255),
    }
  """;

  static String get _tableRaceSkills => """
    CREATE TABLE IF NOT EXISTS $TABLE_RACE_SKILLS{
      $RACE_SKILLS_ID VARCHAR(255) PRIMARY KEY NOT NULL,
      $RACE_SKILLS_NAME VARCHAR(255),
      $RACE_SKILLS_DESC TEXT,
      $RACE_SKILLS_TYPE VARCHAR(255),
      FOREIGN KEY($RACE_ID) REFERNCES $TABLE_RACE($RACE_ID),
    }
  """;  
}
