import 'package:equatable/equatable.dart';

class TodoReduxState extends Equatable {
  final List<int> todos;

  const TodoReduxState(this.todos);

  @override
  List<Object?> get props => [todos];
}
