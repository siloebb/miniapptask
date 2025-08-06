import 'dart:math';

import 'package:miniapptask/src/model/task.dart';

class TaskRepositoryRemote {
  late final _mock;

  TaskRepositoryRemote() {
    _mock = List.generate(200, (index) {
      return Task(
        id: 'remote_$index',
        title: 'Item $index',
        isFavorite: Random().nextBool(),
        timestamp: DateTime.now().subtract(Duration(days: index)),
        tag: ColoredTag.values[Random().nextInt(ColoredTag.values.length)],
      );
    });
  }

  Future<List<Task>> loadTasks({int lastIndex = 0}) async {
    await Future.delayed(const Duration(seconds: 1));
    if (lastIndex >= _mock.length) return [];
    final endIndex = min(lastIndex + 20, _mock.length);
    return _mock.sublist(lastIndex, endIndex);
  }
}
