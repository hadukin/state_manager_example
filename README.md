# state_manager_example

Проект созданный для сравнения возможностей, преимуществ и недостатков популярных менеджеров
состояния (state managers) для Flutter.

- Bloc
- Riverpod
- YxState
- Provider
- ChangeNotifier
- Redux
- MobX

MobX использует кодоген, при добавлении полей нужно будет запустиь build runner

```sh
flutter packages pub run build_runner build --delete-conflicting-outputs
```
