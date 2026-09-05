import 'package:flutter/foundation.dart';
import 'package:state_manager_example/repository/todo_repository.dart';

class ChangeNotifierViewModel extends ChangeNotifier {
  final TodoRepository _repository;

  List<int> todos = [];

  ChangeNotifierViewModel(this._repository);

  Future<void> create(int val) async {
    final todo = await _repository.create(val);
    todos = [...todos, todo.name];
    notifyListeners();
  }
}
