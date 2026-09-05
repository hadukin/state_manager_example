import 'package:flutter/foundation.dart';
import 'package:state_manager_example/bloc_example/bloc/todo_bloc.dart';
import 'package:state_manager_example/repository/todo_repository.dart';

class ProviderViewModel with ChangeNotifier {
  final TodoRepository _repository;

  ProviderViewModel(this._repository);

  TodoState state = TodoState([]);

  Future<void> create(int val) async {
    final todo = await _repository.create(val);
    state = TodoState([...state.todos, todo.name]);
    notifyListeners();
  }

  @override
  void dispose() {
    print('PROVIDER DISPOSE');
    super.dispose();
  }
}
