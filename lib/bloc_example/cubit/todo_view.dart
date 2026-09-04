import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager_example/bloc_example/cubit/todo_cubit.dart';
import 'package:state_manager_example/text_fileld_widget.dart';
import 'package:state_manager_example/repository/todo_repository.dart';

class TodoCubitView extends StatefulWidget {
  const TodoCubitView({super.key});

  @override
  State<TodoCubitView> createState() => _TodoCubitViewState();
}

class _TodoCubitViewState extends State<TodoCubitView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CUBIT')),
      body: BlocProvider(
        create: (context) => TodoCubit(TodoRepository()),
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            return Column(
              children: [
                TextFieldWidget(
                  onCreate: (val) {
                    context.read<TodoCubit>().create(val);
                  },
                ),
                Expanded(
                  child: ListView(
                    children: [
                      for (final todo in state.todos)
                        ListTile(title: Text('$todo')),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
