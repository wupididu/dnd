import 'package:dnd/pages/page_list_of_hero.dart';
import 'package:dnd/pages/page_menu.dart';
import 'package:dnd/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage
({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
          },
          child: Container(
            child: Center(
              child: Container(
                child: Image(image: AssetImage("images/D&D Hero.png"),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}