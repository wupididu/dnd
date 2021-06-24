import 'package:dnd/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfHero extends StatelessWidget {
  const ListOfHero({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Characters"),
        ),
        body: Container(
            child: Center(
              child: Container(
                child: Text("СЕВА, СОСИ БИБУ", style: TextStyle(color: Colors.white, fontSize: 32),),
              ),
            ),
          ),
      ),
    );
  }
}