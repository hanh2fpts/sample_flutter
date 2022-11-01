part of 'navi_bottom_cubit.dart';

@immutable
abstract class NaviBottomState {
  final int currentIndex;

  const NaviBottomState({required this.currentIndex});
}

class NaviBottomInitial extends NaviBottomState {
  const NaviBottomInitial({required super.currentIndex});
}

class CurrentIndexPage extends NaviBottomState {
  const CurrentIndexPage({required super.currentIndex});
}
