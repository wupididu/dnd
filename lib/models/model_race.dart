import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';

class Race extends Model {
  static String table = TABLE_RACE;
  String ID = RACE_ID;

  var id;
  String name;
  String description;
  String imgUrl;

  Race({
    required this.id,
    required this.description,
    required this.name,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      RACE_DESC: description,
      RACE_IMG_URL: imgUrl,
      RACE_NAME: name,
    };

    return map;
  }

  static Race fromMap(Map<String, dynamic> map) {
    return Race(
        id: map[RACE_ID],
        description: map[RACE_DESC],
        imgUrl: map[RACE_IMG_URL],
        name: map[RACE_NAME]);
  }
}
