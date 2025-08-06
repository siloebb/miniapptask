import 'package:bloc/bloc.dart';
import 'package:miniapptask/src/model/task.dart';
import 'package:miniapptask/src/repositories/task_repository_local.dart';
import 'package:equatable/equatable.dart';
import 'package:miniapptask/src/repositories/task_repository_remote.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepositoryLocal localRepository;
  final TaskRepositoryRemote remoteRepository;
  final List<Task> _tasks = [];

  TaskCubit(this.localRepository, this.remoteRepository) : super(const TaskState()) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final tasks = await remoteRepository.loadTasks(lastIndex: _tasks.length);
    _tasks.addAll(tasks);
    emit(state.copyWith(tasks: _tasks, isLoading: false));
  }

  Future<void> toggleTask(String id) async {
    final isFavorite = await localRepository.toggleFavorite(id);
    
    await loadTasks();
  }
}