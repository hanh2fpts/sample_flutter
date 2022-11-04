import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sample_flutter/model/todo_model.dart';

part 'todo_page_event.dart';

part 'todo_page_state.dart';

class TodoPageBloc extends Bloc<TodoPageEvent, TodoPageState> {
  List<TodoModel> listTodoItem;
  int id = 0;
  static String test = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa';
  TodoPageBloc({required this.listTodoItem})
      : super(TodoPageInitial(test ,listTodo: listTodoItem)) {
    on<AddTodo>(_addTodoItem);
    on<MarkComplete>(_markComplete);
  }

  void _addTodoItem(AddTodo event, Emitter<TodoPageState> emit) {
    var item = event.todoItem;
    if (item.title.isNotEmpty && item.description.isNotEmpty) {
      item.id = id++;
      listTodoItem.add(item);
      emit(TodoPageLoaded(listTodo: listTodoItem));
    }
  }

  void _markComplete(MarkComplete event, Emitter<TodoPageState> emit) {
    for (var element in listTodoItem) {
      if (element.id == event.index) {
        element.isComplete = event.isComplete;
      }
    }
    emit(TodoItemComplete(listTodo: listTodoItem));
  }
}
