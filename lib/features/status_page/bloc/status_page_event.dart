part of 'status_page_bloc.dart';

abstract class StatusPageEvent extends Equatable {
  final int todoComplete;
  final int todoInComplete;

  const StatusPageEvent(
      {required this.todoComplete, required this.todoInComplete});

  @override
  List<Object?> get props => [todoInComplete, todoComplete];
}

class StatusPageFetched extends StatusPageEvent {
  const StatusPageFetched(
      {required super.todoComplete, required super.todoInComplete});
}
