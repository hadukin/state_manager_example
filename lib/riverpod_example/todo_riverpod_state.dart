part of 'todo_riverpod_provier.dart';

class TodoState extends Equatable {
  final List<int> todos;

  const TodoState(this.todos);

  @override
  List<Object?> get props => [todos];
}

class TodoStateNotifier extends Notifier<TodoState> {
  late final TodoRepository _repository;

  @override
  TodoState build() {
    _repository = ref.watch(todoRepositoryProvider);

    ref.onDispose(() {
      print("DISPOSE RIVERPOD");
    });

    return TodoState([]);
  }

  Future<void> create(int name) async {
    final todo = await _repository.create(name);
    state = TodoState([...state.todos, todo.name]);
  }
}

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepository();
});
