import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_manager_example/text_fileld_widget.dart';
import 'package:state_manager_example/riverpod_example/todo_riverpod_provier.dart';

class TodoRiverpodView extends ConsumerWidget {
  const TodoRiverpodView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Riverpod')),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              return TextFieldWidget(
                onCreate: (val) {
                  ref.read(todosProvider.notifier).create(val);
                },
              );
            },
          ),
          Expanded(
            child: ListView(
              children: [
                for (final todo in state.todos) ListTile(title: Text('$todo')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
