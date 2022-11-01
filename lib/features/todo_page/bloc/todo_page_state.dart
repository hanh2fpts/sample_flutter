part of 'todo_page_bloc.dart';

@immutable
abstract class TodoPageState {
  final List<TodoModel> listTodo;

  const TodoPageState({required this.listTodo});
}

class TodoPageInitial extends TodoPageState {
  const TodoPageInitial({required super.listTodo});
}

class TodoPageLoaded extends TodoPageState {
  const TodoPageLoaded({required super.listTodo});
}

class TodoItemComplete extends TodoPageState {
  const TodoItemComplete({required super.listTodo});
}

