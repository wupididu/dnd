import 'package:dnd/constants.dart';
import 'package:dnd/logic/app_cubit.dart';
import 'package:dnd/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageCreationgClass extends StatelessWidget {
  final String? classID;



  const PageCreationgClass({ Key? key, this.classID }) : super(key: key);

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
          child: Column(
            children: [
              inputClassID(),


            ],
          ),
        )
      ),
        ),
    );
  }

  Widget inputClassID() => inputFilds(
    initialValue: classID, 
    hint: "Class ID", 
    validator: (classID) => classID != null && classID.isEmpty ? "Class ID can't be empty" : null);

  


  Widget inputFilds({required dynamic initialValue, required String hint, required dynamic validator}) => TextFormField(
    maxLines: 1,
    initialValue: classID,
    style: TextStyle(
      
    ),
    decoration: InputDecoration(
      hintText: hint
    ),
    validator: validator,
  );

}

