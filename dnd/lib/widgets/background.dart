import 'package:flutter/cupertino.dart';

Widget Background({required Widget child}){
  return Stack(
     children: [
       Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              )
            ),
        ),
        child
      ],
  );
}