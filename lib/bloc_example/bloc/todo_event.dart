part of 'todo_bloc.dart';

sealed class TodoEvent {
  const TodoEvent();
}

class TodoCreateEvent extends TodoEvent {
  final int name;

  const TodoCreateEvent(this.name);
}
