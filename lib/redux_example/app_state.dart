import 'package:equatable/equatable.dart';
import 'package:state_manager_example/redux_example/todo/todo_rudux_state.dart';

class AppState extends Equatable {
  final TodoReduxState todo;

  const AppState({required this.todo});

  @override
  List<Object?> get props => [todo];
}
