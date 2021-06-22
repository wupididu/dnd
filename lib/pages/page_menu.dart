import 'package:dnd/pages/page_list_of_class.dart';
import 'package:dnd/pages/page_list_of_hero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [
            CustomButtonForMenu(context, name: "Персонажи", route: ListOfHero()),
            CustomButtonForMenu(context, name: "Классы", route: PageListOfClass())
          ],
        ),
      ),
    );
  }

  GestureDetector CustomButtonForMenu(BuildContext context, {required String name, required Widget route}) {
    return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>route));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(name, style: TextStyle(color: Colors.white, fontSize: 24),),
                    )],
                ),
              ),
            ),
          );
  }
}