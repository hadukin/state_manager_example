import 'package:mobx/mobx.dart';
import 'package:state_manager_example/repository/todo_repository.dart';

part 'todo_mobx_state.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  final TodoRepository _repository;

  _TodoStore(this._repository);

  @observable
  ObservableList<int> todo = ObservableList<int>.of([]);

  @computed
  bool get isMoreThenThree => todo.length > 3;

  @action
  Future<void> create(int val) async {
    final result = await _repository.create(val);
    todo.add(result.name);
  }
}
