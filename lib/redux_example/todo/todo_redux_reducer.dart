import 'package:redux/redux.dart';

import 'package:state_manager_example/redux_example/todo/todo_redux_action.dart';
import 'package:state_manager_example/redux_example/todo/todo_rudux_state.dart';

final todoReducer = combineReducers<TodoReduxState>([
  TypedReducer<TodoReduxState, TodoCreateRequestAction>(_createRequest),
  TypedReducer<TodoReduxState, TodoCreateSuccessAction>(_createSuccess),
  TypedReducer<TodoReduxState, TodoCreateFailureAction>(_createFailure),
]);

TodoReduxState _createRequest(
  TodoReduxState state,
  TodoCreateRequestAction action,
) {
  return state;
}

TodoReduxState _createSuccess(
  TodoReduxState state,
  TodoCreateSuccessAction action,
) {
  return TodoReduxState([...state.todos, action.name]);
}

TodoReduxState _createFailure(
  TodoReduxState state,
  TodoCreateFailureAction action,
) {
  return state;
}
