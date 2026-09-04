import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:state_manager_example/redux_example/app_epic.dart';
import 'package:state_manager_example/redux_example/app_reduxer.dart';
import 'package:state_manager_example/redux_example/app_state.dart';
import 'package:state_manager_example/redux_example/todo/todo_rudux_state.dart';

// final Store<AppState> appReduxStore = Store<AppState>(
//   appReducer,
//   initialState: AppState(todo: TodoReduxState([])),
//   middleware: [EpicMiddleware(createAppEpic())],
//   distinct: true,
// );

extension BuildContextExtension on BuildContext {
  dynamic action(dynamic action) {
    StoreProvider.of<AppState>(this).dispatch(action);
  }
}
