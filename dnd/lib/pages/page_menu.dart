import 'package:dnd/pages/page_list_of_class.dart';
import 'package:dnd/pages/page_list_of_hero.dart';
import 'package:dnd/widgets/background.dart';
import 'package:dnd/widgets/custom_button_for_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Menu"),
        ),
        body: Container(
          child: Column(
            children: [
              CustomButtonForMenu(context, name: "Персонажи", route: ListOfHero()),
              CustomButtonForMenu(context, name: "Классы", route: PageListOfClass())
            ],
          ),
        ),
      ),
    );
  }
}