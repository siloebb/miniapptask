import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniapptask/src/cubit/task_cubit.dart';
import 'package:miniapptask/src/widgets/task_list_item.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskCubit>(context).loadTasks();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        BlocProvider.of<TaskCubit>(context).loadTasks();
      }
    });
  }

  checkNewFavorites(List prev, List next) {
    final prevFavs = prev.where((task) => task.isFavorite).toList();
    final nextFavs = next.where((task) => task.isFavorite).toList();
    return nextFavs.length > prevFavs.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<TaskCubit, TaskState>(
          buildWhen: (prev, next) => checkNewFavorites(prev.tasks, next.tasks),
          builder: (context, state) {
            return Text(
              'Tasks (${state.tasks.where((task) => task.isFavorite).length})',
            );
          },
        ),
      ),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state.isLoading && state.tasks.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            key: const Key('taskListView'),
            itemCount: state.tasks.length + (state.isLoading ? 1 : 0),
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index >= state.tasks.length) {
                return const Center(child: CircularProgressIndicator());
              }
              final task = state.tasks[index];
              return TaskListItem(
                task: task,
                onFavoriteToggle: (task) {
                  context.read<TaskCubit>().toggleTask(task.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}
