import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_manager_example/text_fileld_widget.dart';
import 'package:state_manager_example/redux_example/app_state.dart';
import 'package:state_manager_example/redux_example/todo/todo_redux_action.dart';
import 'package:state_manager_example/redux_example/todo/todo_rudux_state.dart';
import 'package:state_manager_example/redux_example/app_store.dart';

class TodoReduxView extends StatefulWidget {
  const TodoReduxView({super.key});

  @override
  State<TodoReduxView> createState() => _TodoReduxViewState();
}

class _TodoReduxViewState extends State<TodoReduxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Redux')),
      body: StoreConnector<AppState, TodoReduxState>(
        distinct: true,
        converter: (store) => store.state.todo,
        builder: (context, vm) {
          return Column(
            children: [
              TextFieldWidget(
                onCreate: (val) {
                  context.action(TodoCreateRequestAction(val));
                },
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (final todo in vm.todos) ListTile(title: Text('$todo')),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
