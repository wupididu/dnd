import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';

class AbilityScores extends Model {
  static String table = TABLE_ABILITY_SCORES;
  String ID = ABILITY_SCORES_ID;

  var id;
  int strength;
  int dexterity;
  int constitution;
  int intelligence;
  int wisdom;
  int charisma;

  AbilityScores(
      {required this.charisma,
      required this.constitution,
      required this.dexterity,
      required this.id,
      required this.intelligence,
      required this.strength,
      required this.wisdom});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      ABILITY_SCORES_CHA: charisma,
      ABILITY_SCORES_CON: constitution,
      ABILITY_SCORES_DEX: dexterity,
      ABILITY_SCORES_INT: intelligence,
      ABILITY_SCORES_STR: strength,
      ABILITY_SCORES_WIS: wisdom
    };
    return map;
  }

  static AbilityScores fromMap(Map<String, dynamic> map) {
    return AbilityScores(
      charisma: map[ABILITY_SCORES_CHA],
      constitution: map[ABILITY_SCORES_CON],
      dexterity: map[ABILITY_SCORES_DEX],
      id: map[ABILITY_SCORES_ID],
      intelligence: map[ABILITY_SCORES_INT],
      strength: map[ABILITY_SCORES_STR],
      wisdom: map[ABILITY_SCORES_WIS],
    );
  }
}
