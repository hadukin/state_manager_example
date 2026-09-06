import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager_example/repository/todo_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as concurrency;

part 'todo_state.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository;

  TodoBloc(this._repository) : super(TodoState([])) {
    on<TodoEvent>(
      (event, emit) => switch (event) {
        TodoCreateEvent(:final name) => _create(name, emit),
      },
    );
  }

  Future<void> _create(int name, Emitter<TodoState> emitter) async {
    final todo = await _repository.create(name);

    emitter(TodoState([...state.todos, todo.name], isLoading: false));
  }

  @override
  void onEvent(TodoEvent event) {
    super.onEvent(event);
    print('ON_EVENT: ${event}');
  }

  @override
  void onTransition(Transition<TodoEvent, TodoState> transition) {
    super.onTransition(transition);
    print(
      'ON_TRANSITION: ${transition.event} ${transition.currentState} ${transition.nextState}',
    );
  }

  @override
  void onChange(Change<TodoState> change) {
    super.onChange(change);
    print(
      'ON_CHANGE: CURRENT: ${change.currentState} -> NEXT: ${change.nextState}',
    );
  }

  @override
  void onDone(TodoEvent event, [Object? error, StackTrace? stackTrace]) {
    super.onDone(event, error, stackTrace);
    print('ON_DONE: ${event}');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('ON_ERROR: ${error}');
  }

  @override
  Future<void> close() {
    print('CLOSE BLOC');
    return super.close();
  }
}
