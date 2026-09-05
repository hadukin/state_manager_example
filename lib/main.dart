import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:state_manager_example/bloc_example/bloc/todo_view.dart';
import 'package:state_manager_example/bloc_example/cubit/todo_view.dart';
import 'package:state_manager_example/change_notifier_example/change_notifier_view.dart';
import 'package:state_manager_example/mobx_example/todo_mobx_view.dart';
import 'package:state_manager_example/redux_example/app_epic.dart';
import 'package:state_manager_example/redux_example/app_reduxer.dart';
import 'package:state_manager_example/redux_example/app_state.dart';
import 'package:state_manager_example/redux_example/todo/todo_rudux_state.dart';
import 'package:state_manager_example/redux_example/todo_redux_view.dart';
import 'package:state_manager_example/riverpod_example/todo_riverpod_view.dart';
import 'package:state_manager_example/yx_state_example/yx_todo_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBar(title: Text('State manager example'))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => TodoBlocView()));
            },
            child: Text('Bloc'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => TodoCubitView()));
            },
            child: Text('Cubit'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => YxTodoView()));
            },
            child: Text('YxState'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProviderScope(child: TodoRiverpodView());
                  },
                ),
              );
            },
            child: Text('Riverpod'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return TodoMobxView();
                  },
                ),
              );
            },
            child: Text('Mobx'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return StoreProvider(
                      store: Store<AppState>(
                        appReducer,
                        initialState: AppState(todo: TodoReduxState([])),
                        middleware: [EpicMiddleware(createAppEpic())],
                        distinct: true,
                      ),
                      child: TodoReduxView(),
                    );
                  },
                ),
              );
            },
            child: Text('Redux'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ChangeNotifierView();
                  },
                ),
              );
            },
            child: Text('ChangeNotifier'),
          ),
        ],
      ),
    );
  }
}
