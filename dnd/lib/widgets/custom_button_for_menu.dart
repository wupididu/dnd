import 'package:flutter/material.dart';

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
