import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter/features/status_page/bloc/status_page_bloc.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<StatusPageBloc, StatusPageState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Complete',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${state.todoComplete}',
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'InComplete',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${state.todoInComplete}',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          );
        },
      ),
    );
  }
}
