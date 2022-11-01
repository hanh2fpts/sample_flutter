import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navi_bottom_state.dart';

class NaviBottomCubit extends Cubit<NaviBottomState> {
  String title = 'Todos';
  NaviBottomCubit() : super(const NaviBottomInitial(currentIndex: 0));
  void selectBottomIndex({required int index}) {
    if (index == 0) {
      title = 'Todos';
    } else if (index == 1) {
      title = 'Status';
    } else {
      title = 'History';
    }
    emit(CurrentIndexPage(currentIndex: index));
  }
}
