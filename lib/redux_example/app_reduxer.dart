import 'package:state_manager_example/redux_example/app_state.dart';
import 'package:state_manager_example/redux_example/todo/todo_redux_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(todo: todoReducer(state.todo, action));
}
