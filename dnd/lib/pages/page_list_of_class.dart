import 'package:dnd/constants.dart';
import 'package:dnd/logic/abstracts.dart';
import 'package:dnd/logic/app_cubit.dart';
import 'package:dnd/models/model_ability_scores.dart';
import 'package:dnd/models/model_class.dart';
import 'package:dnd/pages/page_creationg_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageListOfClass extends StatelessWidget {
  const PageListOfClass({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit(TABLE_CLASS);
    return Scaffold(
      appBar: AppBar(
        title: Text("Class"),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            )
          ),
          child: BlocBuilder<AppCubit, AppState>(
            bloc: appCubit,
            builder: (context, state){return Center(
              child: ListView.builder(
                itemCount: state.listOfModel.length,
                itemBuilder: (context, index){
                  return Text(state.listOfModel[index].toString());
                },
              )
            );}
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PageCreationgClass()));
          },
        ),
    );
  }
}