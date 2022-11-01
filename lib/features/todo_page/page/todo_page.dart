import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter/di/service_locator.dart';
import 'package:sample_flutter/features/todo_page/bloc/todo_page_bloc.dart';
import 'package:sample_flutter/features/todo_page/page/widgets/add_todo_widget.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});
  void showAddTodoWidget(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddTodoWidget(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoPageBloc, TodoPageState>(builder: (context, state) {
      if (state is TodoPageInitial) {
        return Center(
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showAddTodoWidget(context);
            },
          ),
        );
      } else {
        return Stack(children: [
          ListView.builder(
            itemCount: state.listTodo.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                title: state.listTodo[index].title,
                description: state.listTodo[index].description,
                index: index,
                isComplete: state.listTodo[index].isComplete,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  showAddTodoWidget(context);
                },
              ),
            ),
          )
        ]);
      }
    });
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.index,
      required this.isComplete});
  final String title;
  final String description;
  final int index;
  final bool isComplete;
  @override
  Widget build(BuildContext context) {
    Color bgColor = isComplete ? Colors.green : Colors.grey;
    return Card(
      color: bgColor,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListTile(
        onTap: () {},
        title: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              decoration: isComplete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
              fontSize: 15,
              decoration: isComplete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        leading: Checkbox(
          value: isComplete,
          onChanged: (value) {
            if (value != null) {
              serviceLocator
                  .get<TodoPageBloc>()
                  .add(MarkComplete(isComplete: value, index: index));
            }
          },
        ),
      ),
    );
  }
}
