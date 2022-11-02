import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'status_page_event.dart';

part 'status_page_state.dart';

class StatusPageBloc extends Bloc<StatusPageEvent, StatusPageState> {
  StatusPageBloc()
      : super(const StatusPageInitial(todoComplete: 0, todoInComplete: 0)) {
    on<StatusPageFetched>((event, emit) {
      emit(StatusPageLoaded(
          todoComplete: event.todoComplete,
          todoInComplete: event.todoInComplete));
    });
  }
}
