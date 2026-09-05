import 'package:equatable/equatable.dart';
import 'package:state_manager_example/repository/todo_repository.dart';
import 'package:yx_state/yx_state.dart';
import 'package:yx_state_transformers/yx_state_transformers.dart'
    as transformers;

part 'yx_todo_state.dart';

class TodoStateManager extends StateManager<TodoState> {
  final TodoRepository _repository;

  TodoStateManager(this._repository) : super(TodoState([]));

  Future<void> create(int val) => handle((emit) async {
    final todo = await _repository.create(val);
    emit(TodoState([...state.todos, todo.name]));
  });

  @override
  void onCreate() {
    super.onCreate();
    print('YX CREATE');
  }

  @override
  void onChange(
    TodoState currentState,
    TodoState nextState,
    Object? identifier,
  ) {
    super.onChange(currentState, nextState, identifier);
    print('YX CHANGE: current: $currentState next: $nextState');
  }

  @override
  Future<void> close() {
    print('YX CLOSE');
    return super.close();
  }

  @override
  void onStart(Object? identifier) {
    super.onStart(identifier);
    print('YX START');
  }

  @override
  void onDone(Object? identifier) {
    super.onDone(identifier);
    print('YX DONE');
  }
}
