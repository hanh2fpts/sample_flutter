import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter/di/service_locator.dart';
import 'package:sample_flutter/features/history_page/page/history_page.dart';
import 'package:sample_flutter/features/main_page/cubit/navi_bottom_cubit.dart';
import 'package:sample_flutter/features/status_page/page/status_page.dart';
import 'package:sample_flutter/features/todo_page/page/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaviBottomCubit, NaviBottomState>(
      builder: (context, state) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(serviceLocator.get<NaviBottomCubit>().title),
            ),
            body: IndexedStack(
              index: state.currentIndex,
              children: const [TodoPage(), StatusPage(), HistoryPage()],
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.currentIndex,
                onTap: (value) {
                  serviceLocator
                      .get<NaviBottomCubit>()
                      .selectBottomIndex(index: value);
                },
                items: const [
                  BottomNavigationBarItem(
                      label: 'Todos', icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: 'Status', icon: Icon(Icons.incomplete_circle)),
                  BottomNavigationBarItem(
                      label: 'History', icon: Icon(Icons.history))
                ]));
      },
    );
  }
}
