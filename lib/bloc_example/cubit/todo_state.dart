part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final List<int> todos;

  const TodoState(this.todos);

  @override
  List<Object?> get props => [todos];
}
