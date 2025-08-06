import 'dart:convert';
import 'package:miniapptask/src/model/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRepositoryLocal {
  static const _key = 'tasks';

  Future<bool> toggleFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    await prefs.setStringList(_key, favorites);
    return favorites.contains(id);
  }

}
