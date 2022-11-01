import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter/di/service_locator.dart';
import 'package:sample_flutter/features/main_page/cubit/navi_bottom_cubit.dart';
import 'package:sample_flutter/features/main_page/pages/main_page.dart';
import 'package:sample_flutter/features/todo_page/bloc/todo_page_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator.get<NaviBottomCubit>(),
          ),
          BlocProvider(
            create: (context) => serviceLocator.get<TodoPageBloc>(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
