import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';

class Hero extends Model {
  static String table = TABLE_HERO;
  String ID = HERO_ID;

  var id;
  String name;
  int kd;
  int hit;
  int abilityScoresID;
  String classID;
  String raceID;

  Hero(
      {required this.id,
      required this.name,
      required this.kd,
      required this.hit,
      required this.abilityScoresID,
      required this.classID,
      required this.raceID});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      HERO_NAME: name,
      HERO_KD: kd,
      HERO_HIT: hit,
      ABILITY_SCORES_ID: abilityScoresID,
      CLASS_ID: classID,
      RACE_ID: raceID
    };

    return map;
  }

  static Hero fromMap(Map<String, dynamic> map) {
    return Hero(
        id: map[HERO_ID],
        name: map[HERO_NAME],
        kd: map[HERO_KD],
        abilityScoresID: map[ABILITY_SCORES_ID],
        hit: map[HERO_HIT],
        classID: map[CLASS_ID],
        raceID: map[RACE_ID]);
  }
}
