import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';

class HeroSkills extends Model {
  static String table = TABLE_HERO_SKILLS;
  String ID = HERO_SKILLS_ID;

  var id;
  String name;
  String description;
  String type;
  int bonus;
  int heroID;

  HeroSkills(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.bonus,
      required this.heroID});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      HERO_SKILLS_NAME: name,
      HERO_SKILLS_DESC: description,
      HERO_SKILLS_TYPE: type,
      HERO_SKILLS_BONUS: bonus,
      HERO_ID: heroID
    };
    return map;
  }

  static HeroSkills fromMap(Map<String, dynamic> map) {
    return HeroSkills(
        id: map[HERO_SKILLS_ID],
        name: map[HERO_SKILLS_NAME],
        description: map[HERO_SKILLS_DESC],
        type: map[HERO_SKILLS_TYPE],
        bonus: map[HERO_SKILLS_BONUS],
        heroID: map[HERO_ID]);
  }
}
