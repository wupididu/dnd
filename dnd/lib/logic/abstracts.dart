import 'package:dnd/models/model.dart';
import 'package:dnd/models/model_class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin ControlOFClass{
  Future<void> getListOfClass() ;

  Future<void> addClass(ClassOfHero item);

  Future<void> removeClass(ClassOfHero item);
}

class AppState{
  final List<Map<String, dynamic>> listOfModel;

  AppState(this.listOfModel);
}

abstract class AbstractAppCubit extends Cubit<AppState> with ControlOFClass{
  AbstractAppCubit(AppState initialState) : super(initialState);
}

