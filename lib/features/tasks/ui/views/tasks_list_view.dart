import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/features/tasks/ui/views/tasks_content_view.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_calender.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TasksCalender(),
        Gap(20),
        TasksListViewBody(),
      ],
    );
  }
}
