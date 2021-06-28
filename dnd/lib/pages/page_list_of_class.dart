import 'package:dnd/constants.dart';
import 'package:dnd/logic/abstracts.dart';
import 'package:dnd/logic/app_cubit.dart';
import 'package:dnd/models/model_ability_scores.dart';
import 'package:dnd/models/model_class.dart';
import 'package:dnd/pages/page_creationg_class.dart';
import 'package:dnd/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageListOfClass extends StatelessWidget {
  const PageListOfClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit(TABLE_CLASS);
    appCubit.getListOfModel(TABLE_CLASS);

    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Class"),
        ),
        body: Container(
          child: BlocBuilder<AppCubit, AppState>(
              bloc: appCubit,
              builder: (context, state) {
                return Center(
                    child: ListView.builder(
                  itemCount: state.listOfModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'name: ' +
                                        state.listOfModel[index]['name']
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'desriprion: ' +
                                        state.listOfModel[index]['name']
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'hitDice: ' +
                                        state.listOfModel[index]['hitDice']
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'desriprion: ' +
                                        state.listOfModel[index]['name']
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ));
              }),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Theme.of(context).primaryColor,
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => PageCreationgClass()));
        //   },
        // ),
      ),
    );
  }
}
