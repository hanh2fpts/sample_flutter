import 'package:flutter_bloc/flutter_bloc.dart';

class TodoObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('aaaaaaaaaaa ${transition.event} + ${transition.nextState}');
  }
}
