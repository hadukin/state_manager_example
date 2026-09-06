import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_manager_example/repository/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _repository;

  TodoCubit(this._repository) : super(TodoState([]));

  Future<void> create(int name) async {
    final todo = await _repository.create(name);
    emit(TodoState([...state.todos, todo.name]));
  }

  @override
  void onChange(Change<TodoState> change) {
    super.onChange(change);
    print(
      'ON_CHANGE: CURRENT: ${change.currentState} -> NEXT: ${change.nextState}',
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() {
    print('CLOSE CUBIT');
    return super.close();
  }
}
