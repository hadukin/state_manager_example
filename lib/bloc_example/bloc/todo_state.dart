part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<int> todos;
  final bool isLoading;

  const TodoState(this.todos, {this.isLoading = false});

  @override
  List<Object?> get props => [todos, isLoading];
}
