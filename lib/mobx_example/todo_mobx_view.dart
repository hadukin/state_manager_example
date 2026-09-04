import 'package:flutter/material.dart';
import 'package:state_manager_example/text_fileld_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_manager_example/repository/todo_repository.dart';
import 'package:state_manager_example/mobx_example/todo_mobx_state.dart';

class TodoMobxView extends StatefulWidget {
  const TodoMobxView({super.key});

  @override
  State<TodoMobxView> createState() => _TodoMobxViewState();
}

class _TodoMobxViewState extends State<TodoMobxView> {
  @override
  Widget build(BuildContext context) {
    return Provider<TodoStore>(
      create: (BuildContext context) => TodoStore(TodoRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text('MobX')),
        body: Consumer<TodoStore>(
          builder: (context, store, _) {
            return Column(
              children: [
                TextFieldWidget(
                  onCreate: (val) {
                    store.create(val);
                  },
                ),
                Observer(
                  builder: (context) {
                    return Text('isMoreThenThree: ${store.isMoreThenThree}');
                  },
                ),
                Expanded(
                  child: Observer(
                    builder: (context) {
                      return ListView(
                        children: [
                          for (final todo in store.todo)
                            ListTile(title: Text('$todo')),
                        ],
                      );
                    },
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
