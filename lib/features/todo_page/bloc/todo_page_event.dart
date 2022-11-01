part of 'todo_page_bloc.dart';

@immutable
abstract class TodoPageEvent {}

class AddTodo extends TodoPageEvent {
  final TodoModel todoItem;
  AddTodo({required this.todoItem});
}

class MarkComplete extends TodoPageEvent {
  final bool isComplete;
  final int index;
  MarkComplete({required this.isComplete, required this.index});
}
