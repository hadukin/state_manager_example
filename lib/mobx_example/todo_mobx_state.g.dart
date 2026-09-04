// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_mobx_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStore, Store {
  Computed<bool>? _$isMoreThenThreeComputed;

  @override
  bool get isMoreThenThree => (_$isMoreThenThreeComputed ??= Computed<bool>(
    () => super.isMoreThenThree,
    name: '_TodoStore.isMoreThenThree',
  )).value;

  late final _$todoAtom = Atom(name: '_TodoStore.todo', context: context);

  @override
  ObservableList<int> get todo {
    _$todoAtom.reportRead();
    return super.todo;
  }

  @override
  set todo(ObservableList<int> value) {
    _$todoAtom.reportWrite(value, super.todo, () {
      super.todo = value;
    });
  }

  late final _$createAsyncAction = AsyncAction(
    '_TodoStore.create',
    context: context,
  );

  @override
  Future<void> create(int val) {
    return _$createAsyncAction.run(() => super.create(val));
  }

  @override
  String toString() {
    return '''
todo: ${todo},
isMoreThenThree: ${isMoreThenThree}
    ''';
  }
}
