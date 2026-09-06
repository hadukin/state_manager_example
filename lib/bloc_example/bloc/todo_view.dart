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
        child: _blocBuilder(),
      ),
    );
  }

  Widget _blocBuilder() {
    return BlocBuilder<TodoBloc, TodoState>(
      buildWhen: (previous, current) {
        // Для оптимизации
        // Можно добавить при каких условиях должно происходить обновление
        return true;
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

  Widget _blocConsumer() {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        print("BLOC $state");
      },
      buildWhen: (previous, current) {
        // Для оптимизации
        // Можно добавить при каких условиях должно происходить обновление
        return true;
      },
      listenWhen: (previous, current) {
        // Для оптимизации
        // Можно добавить при каких условиях должно происходить обновление
        return true;
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

  Widget _blocSelector() {
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

class _BlocWithoutWidget extends StatelessWidget {
  const _BlocWithoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoBloc>().state.todos;
    final isLoading = context.select((TodoBloc value) => value.state.isLoading);

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
  }
}
