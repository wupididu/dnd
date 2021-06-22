import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';

class Spells extends Model {
  static String table = TABLE_SPELLS;
  String ID = SPELLS_ID;

  var id;
  String name;
  String description;
  int hitDice;
  String typeDamage;
  int heroID;

  Spells(
      {required this.id,
      required this.name,
      required this.description,
      required this.heroID,
      required this.hitDice,
      required this.typeDamage});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      SPELLS_NAME: name,
      SPELLS_DESC: description,
      SPELLS_HIT_DICE: hitDice,
      SPELLS_TYPE_DAMAGE: typeDamage,
      HERO_ID: heroID
    };

    return map;
  }

  static Spells fromMap(Map<String, dynamic> map) {
    return Spells(
        id: map[SPELLS_ID],
        name: map[SPELLS_NAME],
        description: map[SPELLS_DESC],
        hitDice: map[SPELLS_HIT_DICE],
        typeDamage: map[SPELLS_TYPE_DAMAGE],
        heroID: map[HERO_ID]);
  }
}
