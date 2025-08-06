
import 'package:flutter/material.dart';
import 'package:miniapptask/src/model/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final Function(Task) onFavoriteToggle;
  const TaskListItem({super.key, required this.task, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: task.tag.color,
      child: Row(children: [
        Text(task.title),
        const SizedBox(width: 8),
        IconButton(
          icon: Icon(task.isFavorite ? Icons.favorite : Icons.favorite_border),
          onPressed: () {
            onFavoriteToggle(task);
          },
        ),
      ],),
    );
  }
}