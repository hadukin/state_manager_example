import 'package:flutter/material.dart';
import 'package:state_manager_example/text_fileld_widget.dart';
import 'package:state_manager_example/repository/todo_repository.dart';
import 'package:state_manager_example/yx_state_example/yx_todo_manager.dart';
import 'package:yx_state_flutter/yx_state_flutter.dart';

class YxTodoView extends StatefulWidget {
  const YxTodoView({super.key});

  @override
  State<YxTodoView> createState() => _YxTodoViewState();
}

class _YxTodoViewState extends State<YxTodoView> {
  late final TodoStateManager _stateManager = TodoStateManager(
    TodoRepository(),
  );

  @override
  void dispose() {
    _stateManager.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YxState')),
      body: _builder(),
    );
  }

  Widget _builder() {
    return StateBuilder(
      stateReadable: _stateManager,
      builder: (context, state, _) {
        return Column(
          children: [
            TextFieldWidget(
              onCreate: (val) {
                _stateManager.create(val);
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
    return StateConsumer(
      listener: (context, state) {
        print("CONSUMER: ${state}");
      },
      stateReadable: _stateManager,
      builder: (context, state, _) {
        return Column(
          children: [
            TextFieldWidget(
              onCreate: (val) {
                _stateManager.create(val);
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
    return StateSelector(
      selector: (state) => state.todos,
      stateReadable: _stateManager,
      builder: (context, todos, _) {
        return Column(
          children: [
            TextFieldWidget(
              onCreate: (val) {
                _stateManager.create(val);
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
