import 'package:redux_epics/redux_epics.dart';
import 'package:state_manager_example/redux_example/app_state.dart';
import 'package:state_manager_example/redux_example/todo/todo_redux_epic.dart';

Epic<AppState> createAppEpic() {
  return combineEpics<AppState>([todoEpics]);
}
