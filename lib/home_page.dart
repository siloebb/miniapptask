

import 'package:flutter/material.dart';
import 'package:miniapptask/src/pages/task_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ListView.builder(
      itemCount: 0,
      itemBuilder: (context, state){
        return null;

    });

    return MaterialApp(
      home: TaskListPage(),
    );
  }
}
