import 'package:flutter_bloc/flutter_bloc.dart';

class TodoObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    //print('aaaaaaaaaaa ${transition.currentState} + ${transition.nextState}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print('aaaaaaaaaaa ${change.currentState} + ${change.nextState}');
  }
}
