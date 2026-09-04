import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager_example/bloc_example/bloc/todo_bloc.dart';
import 'package:state_manager_example/text_fileld_widget.dart';
import 'package:state_manager_example/repository/todo_repository.dart';

class TodoBlocView extends StatefulWidget {
  const TodoBlocView({super.key});

  @override
  State<TodoBlocView> createState() => _TodoBlocViewState();
}

class _TodoBlocViewState extends State<TodoBlocView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLOC')),
      body: BlocProvider(
        create: (context) => TodoBloc(TodoRepository()),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return Column(
              children: [
                TextFieldWidget(
                  onCreate: (val) {
                    context.read<TodoBloc>().add(TodoCreateEvent(val));
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

  Widget _builder() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Column(
          children: [
            TextFieldWidget(
              onCreate: (val) {
                context.read<TodoBloc>().add(TodoCreateEvent(val));
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
    );
  }

  Widget _consumer() {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        print("BLOC $state");
      },
      builder: (context, state) {
        return Column(
          children: [
            TextFieldWidget(
              onCreate: (val) {
                context.read<TodoBloc>().add(TodoCreateEvent(val));
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
    );
  }

  Widget _selector() {
    return BlocSelector<TodoBloc, TodoState, List<int>>(
      selector: (state) => state.todos,
      builder: (context, todos) {
        return Column(
          children: [
            TextFieldWidget(
              onCreate: (val) {
                context.read<TodoBloc>().add(TodoCreateEvent(val));
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  for (final todo in todos) ListTile(title: Text('$todo')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
