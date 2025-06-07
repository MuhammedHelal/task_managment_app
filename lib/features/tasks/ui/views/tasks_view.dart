import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/features/create_task/ui/views/create_task_view.dart';
import 'package:planning_app/features/tasks/ui/views/todo_history_view.dart';

import '../widgets/tasks_list_view_widgets/tasks_list_view_bloc_provider.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushNamed(
            CreateTaskView.routeName,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TasksListViewBlocProvider(),
              Gap(20),
              _HistoryDivider(),
              Gap(10),
              TasksHistoryView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryDivider extends StatelessWidget {
  const _HistoryDivider();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Gap(20),
        Expanded(child: Divider()),
        Gap(20),
        Text('History'),
        Gap(20),
        Expanded(child: Divider()),
        Gap(20),
      ],
    );
  }
}
