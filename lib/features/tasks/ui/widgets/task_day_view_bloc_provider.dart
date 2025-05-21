import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/logic/cubit/tasks_list_cubit.dart';
import 'package:planning_app/features/tasks/logic/repos/tasks_repo.dart';
import 'package:planning_app/features/tasks/ui/views/task_day_view.dart';

class TaskDayViewBlocProvider extends StatelessWidget {
  const TaskDayViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksListCubit(TasksRepo()),
      child: TaskDayView(
        tasksDayEntity: TasksDayEntity(
          date: DateTime.now().toString(),
          tasks: [],
        ),
      ),
    );
  }
}
