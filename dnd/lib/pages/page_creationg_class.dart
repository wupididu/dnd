import 'package:dnd/constants.dart';
import 'package:dnd/logic/app_cubit.dart';
import 'package:dnd/models/model_ability_scores.dart';
import 'package:dnd/models/model_class.dart';
import 'package:dnd/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageCreationgClass extends StatelessWidget {
  final CreateClassOfHeroController createClassController =
      CreateClassOfHeroController();
  final CreateAbilityScoresController createAbilityScoresController =
      CreateAbilityScoresController();

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit(TABLE_CLASS);

    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Creating class"),
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              InputWidget(createClassController.classIDControlller, "ClassID"),
              InputWidget(createClassController.classNameController, "Name"),
              InputWidget(
                  createClassController.classDecsControler, "Description"),
              InputWidget(createClassController.imgUrlController, "imgUrl"),
              InputWidget(
                  createClassController.classHitDiceContoller, "HitDice"),
              InputWidget(createAbilityScoresController.cha_controller, "CHA"),
              InputWidget(createAbilityScoresController.dex_controller, "DEX"),
              InputWidget(createAbilityScoresController.int_controller, "INT"),
              InputWidget(createAbilityScoresController.str_controller, "STR"),
              InputWidget(createAbilityScoresController.wis_controller, "WIS"),
              InputWidget(createAbilityScoresController.con_controller, "CON"),
              TextButton(
                onPressed: () async {
                  createClassController.createClass(
                      appCubit,
                      await createAbilityScoresController
                          .createAbilityScores(appCubit));
                  print(appCubit.getListOfModel(TABLE_HERO).toString());
                },
                child: Text("create"),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget InputWidget(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Color.fromRGBO(22, 90, 45, 90),
          filled: true,
          labelText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(90.0),
              borderSide: BorderSide(color: Color.fromRGBO(22, 90, 45, 90))),
        ),
      ),
    );
  }
}

class CreateClassOfHeroController {
  TextEditingController classIDControlller = TextEditingController();
  TextEditingController classNameController = TextEditingController();
  TextEditingController classDecsControler = TextEditingController();
  TextEditingController imgUrlController = TextEditingController();
  TextEditingController classHitDiceContoller = TextEditingController();

  void createClass(AppCubit appCubit, int abilityScoresid) async {
    ClassOfHero item = ClassOfHero(
        id: classIDControlller.text,
        name: classNameController.text,
        description: classDecsControler.text,
        hitDice: int.parse(classHitDiceContoller.text),
        imgUrl: imgUrlController.text,
        abilityScoresID: abilityScoresid);

    await appCubit.addModel(item, TABLE_CLASS);
  }
}

class CreateAbilityScoresController {
  TextEditingController str_controller = TextEditingController();
  TextEditingController dex_controller = TextEditingController();
  TextEditingController con_controller = TextEditingController();
  TextEditingController int_controller = TextEditingController();
  TextEditingController wis_controller = TextEditingController();
  TextEditingController cha_controller = TextEditingController();

  Future<int> createAbilityScores(AppCubit appCubit) async {
    AbilityScores item = AbilityScores(
        charisma: int.parse(cha_controller.text),
        constitution: int.parse(con_controller.text),
        dexterity: int.parse(dex_controller.text),
        intelligence: int.parse(int_controller.text),
        strength: int.parse(str_controller.text),
        wisdom: int.parse(wis_controller.text));
    return await appCubit.addModel(item, TABLE_ABILITY_SCORES);
  }
}
