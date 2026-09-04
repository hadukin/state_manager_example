sealed class TodoAction {
  const TodoAction();
}

final class TodoCreateRequestAction extends TodoAction {
  final int name;

  TodoCreateRequestAction(this.name);
}

final class TodoCreateSuccessAction extends TodoAction {
  final int name;

  const TodoCreateSuccessAction(this.name);
}

final class TodoCreateFailureAction extends TodoAction {
  final String message;

  const TodoCreateFailureAction(this.message);
}
