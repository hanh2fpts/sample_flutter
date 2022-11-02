part of 'history_page_bloc.dart';

abstract class HistoryPageEvent extends Equatable {
  const HistoryPageEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HistoryPageFetched extends HistoryPageEvent {}
