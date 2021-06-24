import 'package:dnd/models/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin ControlOFModels{
  Future<void> getListOfModel(String name_of_table);

  Future<void> addModel(Model item, String name_of_table);

  Future<void> removeModel(Model item, String name_of_table);
}

class AppState{
  final List<Map<String, dynamic>> listOfModel;

  AppState(this.listOfModel);
}

abstract class AbstractAppCubit extends Cubit<AppState> with ControlOFModels{
  AbstractAppCubit(AppState initialState) : super(initialState);
}

