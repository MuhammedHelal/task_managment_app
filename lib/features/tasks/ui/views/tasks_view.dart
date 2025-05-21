import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/features/create_task/ui/views/create_task_view.dart';
import 'package:planning_app/features/tasks/ui/views/todo_history_view.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_calender.dart';
import 'package:planning_app/features/tasks/ui/views/tasks_content_view.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushNamed(
            TaskFormView.routeName,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  TodoCalender(),
                  Gap(20),
                  TasksContentView(),
                ],
              ),
              Gap(20),
              Row(
                children: [
                  Gap(20),
                  Expanded(child: Divider()),
                  Gap(20),
                  Text('History'),
                  Gap(20),
                  Expanded(child: Divider()),
                  Gap(20),
                ],
              ),
              Gap(10),
              TodoHistoryView(),
            ],
          ),
        ),
      ),
    );
  }
}
