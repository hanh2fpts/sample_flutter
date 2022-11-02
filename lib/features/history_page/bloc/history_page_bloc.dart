import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_page_event.dart';
part 'history_page_state.dart';

class HistoryPageBloc extends Bloc<HistoryPageEvent, HistoryPageState> {
  HistoryPageBloc() : super(HistoryPageInitial()) {
    on<HistoryPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
