import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';

class Weapon extends Model {
  static String table = TABLE_WEAPONS;
  String ID = WEAPONS_ID;

  var id;
  String name;
  String hitDice;
  String description;
  String typeDamage;
  int heroID;

  Weapon(
      {required this.id,
      required this.description,
      required this.heroID,
      required this.hitDice,
      required this.name,
      required this.typeDamage});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      WEAPONS_NAME: name,
      WEAPONS_HIT_DICE: hitDice,
      WEAPONS_DESC: description,
      WEAPONS_TYPE_DAMAGE: typeDamage,
      HERO_ID: heroID
    };

    return map;
  }

  static Weapon fromMap(Map<String, dynamic> map) {
    return Weapon(
      id: map[WEAPONS_ID],
      description: map[WEAPONS_DESC],
      heroID: map[HERO_ID],
      hitDice: map[WEAPONS_HIT_DICE],
      name: map[WEAPONS_NAME],
      typeDamage: map[WEAPONS_TYPE_DAMAGE],
    );
  }
}
