import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfHero extends StatelessWidget {
  const ListOfHero({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Container(
              child: Text("СЕВА, СОСИ БИБУ", style: TextStyle(color: Colors.white, fontSize: 32),),
            ),
          ),
        ),
    );
  }
}