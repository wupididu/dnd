import 'package:dnd/constants.dart';
import 'package:dnd/models/model.dart';

class Item extends Model {
  static String table = TABLE_ITEM;
  String ID = ITEM_ID;

  var id;
  String name;
  String description;
  int heroID;

  Item({
    required this.id,
    required this.description,
    required this.heroID,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      ITEM_NAME: name,
      ITEM_DESC: description,
      HERO_ID: heroID
    };

    return map;
  }

  static Item fromMap(Map<String, dynamic> map) {
    return Item(
      id: map[ITEM_ID],
      description: map[ITEM_DESC],
      heroID: map[HERO_ID],
      name: map[ITEM_NAME],
    );
  }
}
