import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';

class ClassOfHero extends Model {
  static String table = TABLE_CLASS;
  String ID = CLASS_ID;

  var id;
  String name;
  String description;
  String imgUrl;
  int hitDice;
  int abilityScoresID;

  ClassOfHero(
      {required this.abilityScoresID,
      required this.description,
      required this.hitDice,
      required this.id,
      required this.imgUrl,
      required this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      CLASS_ID: id,
      CLASS_NAME: name,
      CLASS_DESC: description,
      CLASS_HIT_DICE: hitDice,
      CLASS_IMG_URL: imgUrl,
      ABILITY_SCORES_ID: abilityScoresID
    };
    return map;
  }

  ClassOfHero fromMap(Map<String, dynamic> map) {
    return ClassOfHero(
      abilityScoresID: map[ABILITY_SCORES_ID],
      description: map[CLASS_DESC],
      hitDice: map[CLASS_HIT_DICE],
      id: map[CLASS_ID],
      imgUrl: map[CLASS_IMG_URL],
      name: map[CLASS_NAME],
    );
  }
}
