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

Таблица сравнения решений:

| Package        | Порог входа | Бойлерплейт | Concurrency |
|----------------|-------------|-------------|-------------|
| Bloc           | Средний     | Средний     | Есть        |
| Cubit          | Низикий     | Низкий      | -           |
| Riverpod       | Высокий     | Средний     | -           |
| YxState        | Низкий      | Низкий      | Есть        |
| Provider       | Низкий      | Низкий      | -           |
| ChangeNotifier | Низкий      | Низкий      | -           |
| Redux          | Высокий     | Высокий     | -           |
| MobX           | Средний     | Средний     | -           |

concurrency - это возможность из коробки настройки последовательности выполнения событий

- concurrent - обрабатывать события одновременно
- sequential - обрабатывать события последовательно
- droppable - игнорировать все добавленные события во время обработки текущего
- restartable - обрабатывать только последнее событие и отменять предыдущие обработчики событий

**Мой личный рейтинг на данный момент:**

1. YxState
2. Bloc/Cubit
3. Provider
4. ChangeNotifier
5. Redux
6. MobX
7. Riverpod

На данный момент в проектах я использую Bloc и YxState - это 2 самых зрелых решения.
