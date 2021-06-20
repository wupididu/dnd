import 'package:dnd/pages/page_list_of_hero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage
({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListOfHero()));
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Container(
              child: Image(image: AssetImage("images/D&D Hero.png"),),
            ),
          ),
        ),
      ),
    );
  }
}