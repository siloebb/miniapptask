import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniapptask/home_page.dart';
import 'package:miniapptask/src/cubit/task_cubit.dart';
import 'package:miniapptask/src/repositories/task_repository_remote.dart';

import 'src/repositories/task_repository_local.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => TaskCubit(TaskRepositoryLocal(), TaskRepositoryRemote()),
      child: const App(),
    ),
  );
}