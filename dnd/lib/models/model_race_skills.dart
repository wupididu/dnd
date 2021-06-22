import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';

class RaceSkills extends Model {
  static String table = TABLE_RACE_SKILLS;
  String ID = RACE_SKILLS_ID;

  var id;
  String name;
  String description;
  String type;
  String raceID;

  RaceSkills({
    required this.description,
    required this.id,
    required this.name,
    required this.raceID,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      RACE_SKILLS_DESC: description,
      RACE_SKILLS_NAME: name,
      RACE_SKILLS_TYPE: type,
      RACE_ID: raceID,
    };
    return map;
  }

  static RaceSkills fromMap(Map<String, dynamic> map) {
    return RaceSkills(
      id: map[RACE_SKILLS_ID],
      description: map[RACE_SKILLS_DESC],
      name: map[RACE_SKILLS_NAME],
      raceID: map[RACE_ID],
      type: map[RACE_SKILLS_TYPE],
    );
  }
}
