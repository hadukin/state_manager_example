import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import 'package:state_manager_example/repository/todo_repository.dart';

part 'todo_riverpod_state.dart';

final todosProvider = NotifierProvider<TodoStateNotifier, TodoState>(
  TodoStateNotifier.new,
  name: 'todos',
  dependencies: [todoRepositoryProvider],
  isAutoDispose: true,
);
