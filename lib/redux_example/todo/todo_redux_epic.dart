import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/transformers.dart';
import 'package:state_manager_example/redux_example/app_state.dart';
import 'package:state_manager_example/redux_example/todo/todo_redux_action.dart';
import 'package:state_manager_example/repository/todo_repository.dart';

final todoEpics = combineEpics<AppState>([
  TypedEpic<AppState, TodoCreateRequestAction>(
    _TodoCreateEpics(TodoRepository()),
  ),
]);

class _TodoCreateEpics implements EpicClass<AppState> {
  final TodoRepository _repository;

  const _TodoCreateEpics(this._repository);

  @override
  Stream<TodoAction> call(Stream actions, EpicStore<AppState> store) {
    return actions.whereType<TodoCreateRequestAction>().asyncExpand((
      event,
    ) async* {
      try {
        final todo = await _repository.create(event.name);
        yield TodoCreateSuccessAction(todo.name);
      } catch (e) {
        yield const TodoCreateFailureAction('Something went wrong');
      }
    });
  }
}
