import 'dart:async';
import 'dart:io';
import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider instance = DBProvider._();

  static Database? _db;

  static int get _version => 2;

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await init();
    return _db!;
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  static Future<Database> init() async {
    Directory dbDir = await getApplicationDocumentsDirectory();
    String _path = join(dbDir.path, 'database.db');
    return await openDatabase(_path, version: _version, onCreate: onCreate);
  }

  static void onCreate(Database db, int version) async {
    await db.execute(_tableAbilityScores);
    await db.execute(_tableClass);
    await db.execute(_tableRace);
    await db.execute(_tableRaceSkills);
    await db.execute(_tableHero);
    await db.execute(_tableHeroSkills);
    await db.execute(_tableSpells);
    await db.execute(_tableItem);
    await db.execute(_tableWeapons);
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await database;
    return db.query(table);
  }

  Future<int> insert(String table, Model model) async {
    final db = await database;
    return await db.insert(table, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(String table, Model model) async {
    final db = await database;
    return await db.update(table, model.toMap(),
        where: '${model.ID} = ?', whereArgs: [model.id]);
  }

  Future<int> delete(String table, Model model) async {
    final db = await database;
    return await db
        .delete(table, where: '${model.ID} = ?', whereArgs: [model.id]);
  }

  static String get _tableHero => """
    CREATE TABLE IF NOT EXISTS $TABLE_HERO (
      $HERO_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $HERO_NAME VARCHAR(255),
      $HERO_KD INTEGER,
      $HERO_HIT INTEGER,
      $ABILITY_SCORES_ID INTEGER,
      $CLASS_ID VARCHAR(255),
      $RACE_ID VARCHAR(255),
      FOREIGN KEY($ABILITY_SCORES_ID) REFERENCES $TABLE_ABILITY_SCORES($ABILITY_SCORES_ID),
      FOREIGN KEY($CLASS_ID) REFERENCES $TABLE_CLASS($CLASS_ID),
      FOREIGN KEY($RACE_ID) REFERENCES $TABLE_RACE($RACE_ID)
    );
   """;

  static String get _tableHeroSkills => """
    CREATE TABLE IF NOT EXISTS $TABLE_HERO_SKILLS (
      $HERO_SKILLS_ID VARCHAR(255) NOT NULL PRIMARY KEY,
      $HERO_SKILLS_NAME VARCHAR(255),
      $HERO_SKILLS_DESC TEXT,
      $HERO_SKILLS_TYPE VARCHAR(255),
      $HERO_SKILLS_BONUS INTEGER,
      $HERO_ID INTEGER,
      FOREIGN KEY($HERO_ID) REFERENCES $TABLE_HERO($HERO_ID)
    );
  """;

  static String get _tableSpells => """
    CREATE TABLE IF NOT EXISTS $TABLE_SPELLS (
      $SPELLS_ID TEXT NOT NULL PRIMARY KEY,
      $SPELLS_NAME VARCHAR(255),
      $SPELLS_DESC TEXT,
      $SPELLS_HIT_DICE INTEGER,
      $SPELLS_TYPE_DAMAGE VARCHAR(255),
      $HERO_ID INTEGER,
      FOREIGN KEY($HERO_ID) REFERENCES $TABLE_HERO($HERO_ID)
    );
  """; // SpellsID = String(HeroID) + name

  static String get _tableItem => """
    CREATE TABLE IF NOT EXISTS $TABLE_ITEM (
      $ITEM_ID TEXT NOT NULL Primary KEY,
      $ITEM_NAME VARCHAR(255),
      $ITEM_DESC TEXT,
      $HERO_ID INTEGER,
      FOREIGN KEY($HERO_ID) REFERENCES $TABLE_HERO($HERO_ID)
    );
  """;

  static String get _tableWeapons => """
    CREATE TABLE IF NOT EXISTS $TABLE_WEAPONS(
      $WEAPONS_ID VARCHAR(255) NOT NULL PRIMARY KEY,
      $WEAPONS_NAME VARCHAR(255),
      $WEAPONS_HIT_DICE VARCHAR(255),
      $WEAPONS_DESC TEXT,
      $WEAPONS_TYPE_DAMAGE VARCHAR(255),
      $HERO_ID INTEGER,
      FOREIGN KEY($HERO_ID) REFERENCES $TABLE_HERO($HERO_ID)
    );
  """;

  static String get _tableAbilityScores => """
    CREATE TABLE IF NOT EXISTS $TABLE_ABILITY_SCORES(
      $ABILITY_SCORES_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $ABILITY_SCORES_STR INTEGER,
      $ABILITY_SCORES_DEX INTEGER,
      $ABILITY_SCORES_CON INTEGER,
      $ABILITY_SCORES_INT INTEGER,
      $ABILITY_SCORES_WIS INTEGER,
      $ABILITY_SCORES_CHA INTEGER
    );
  """;

  static String get _tableClass => """
    CREATE TABLE IF NOT EXISTS $TABLE_CLASS(
      $CLASS_ID VARCHAR(255) PRIMARY KEY NOT NULL,
      $CLASS_NAME VARCHAR(255),
      $CLASS_DESC TEXT,
      $CLASS_IMG_URL VARCHAR(255),
      $CLASS_HIT_DICE INTEGER,
      $ABILITY_SCORES_ID INTEGER,
      FOREIGN KEY($ABILITY_SCORES_ID) REFERENCES $TABLE_ABILITY_SCORES($ABILITY_SCORES_ID)
    );
  """;

  static String get _tableRace => """
    CREATE TABLE IF NOT EXISTS $TABLE_RACE(
      $RACE_ID VARCHAR(255) PRIMARY KEY NOT NULL,
      $RACE_NAME VARCHAR(255),
      $RACE_DESC TEXT,
      $RACE_IMG_URL VARCHAR(255)
    );
  """;

  static String get _tableRaceSkills => """
    CREATE TABLE IF NOT EXISTS $TABLE_RACE_SKILLS(
      $RACE_SKILLS_ID VARCHAR(255) PRIMARY KEY NOT NULL,
      $RACE_SKILLS_NAME VARCHAR(255),
      $RACE_SKILLS_DESC TEXT,
      $RACE_SKILLS_TYPE VARCHAR(255),
      $RACE_ID VARCHAR(255),
      FOREIGN KEY($RACE_ID) REFERENCES $TABLE_RACE($RACE_ID)
    );
  """;
}
