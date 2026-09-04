import 'package:equatable/equatable.dart';

class TodoRepository {
  Future<Todo> create(int v) async {
    await Future.delayed(Duration(seconds: v));
    return Todo(v);
  }
}

class Todo extends Equatable {
  final int name;

  const Todo(this.name);

  @override
  List<Object?> get props => [name];
}
