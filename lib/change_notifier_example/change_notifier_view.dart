import 'package:flutter/material.dart';
import 'package:state_manager_example/change_notifier_example/change_notifier_view_model.dart';
import 'package:state_manager_example/repository/todo_repository.dart';
import 'package:state_manager_example/text_fileld_widget.dart';

class ChangeNotifierView extends StatefulWidget {
  const ChangeNotifierView({super.key});

  @override
  State<ChangeNotifierView> createState() => _ChangeNotifierViewState();
}

class _ChangeNotifierViewState extends State<ChangeNotifierView> {
  final vm = ChangeNotifierViewModel(TodoRepository());

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifier')),
      body: Column(
        children: [
          TextFieldWidget(
            onCreate: (val) {
              vm.create(val);
            },
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: vm,
              builder: (context, child) {
                return ListView(children: [for (final todo in vm.todos) ListTile(title: Text('$todo'))]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
