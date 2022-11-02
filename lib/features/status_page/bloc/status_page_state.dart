part of 'status_page_bloc.dart';

abstract class StatusPageState extends Equatable {
  final int todoComplete;
  final int todoInComplete;

  const StatusPageState(
      {required this.todoComplete, required this.todoInComplete});

  @override
  List<Object> get props => [todoComplete, todoInComplete];
}

class StatusPageInitial extends StatusPageState {
  const StatusPageInitial(
      {required super.todoComplete, required super.todoInComplete});
}

class StatusPageLoaded extends StatusPageState {
  const StatusPageLoaded(
      {required super.todoComplete, required super.todoInComplete});
}
