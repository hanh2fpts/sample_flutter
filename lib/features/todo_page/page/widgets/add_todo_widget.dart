import 'package:flutter/material.dart';
import 'package:sample_flutter/di/service_locator.dart';
import 'package:sample_flutter/features/todo_page/bloc/todo_page_bloc.dart';
import 'package:sample_flutter/model/todo_model.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({super.key});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Add Todo Task',
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('title'), border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
                label: Text('description'), border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size(100, 40)),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var item = TodoModel.create(
                        title: titleController.text,
                        description: descriptionController.text);
                    serviceLocator
                        .get<TodoPageBloc>()
                        .add(AddTodo(todoItem: item));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40)),
                  child: const Text('Add')),
            ],
          ),
        )
      ],
    );
  }
}
