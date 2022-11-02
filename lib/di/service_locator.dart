import 'package:get_it/get_it.dart';
import 'package:sample_flutter/features/main_page/cubit/navi_bottom_cubit.dart';
import 'package:sample_flutter/features/status_page/bloc/status_page_bloc.dart';
import 'package:sample_flutter/features/todo_page/bloc/todo_page_bloc.dart';
import 'package:sample_flutter/model/todo_model.dart';

final serviceLocator = GetIt.instance;
Future<void> setUpServiceLocator() async {
  serviceLocator.registerLazySingleton(() => NaviBottomCubit());
  serviceLocator
      .registerLazySingleton(() => TodoPageBloc(listTodoItem: <TodoModel>[]));
  serviceLocator.registerLazySingleton(() => StatusPageBloc());

  
}
