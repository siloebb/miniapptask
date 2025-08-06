part of 'task_cubit.dart';

class TaskState {
  final List<Task> tasks;
  final bool isLoading;

  const TaskState({this.tasks = const [], this.isLoading = false});

  TaskState copyWith({List<Task>? tasks, bool? isLoading}) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
    );
  }

}
