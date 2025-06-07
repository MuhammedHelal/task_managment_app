import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_day_view_cubit/task_day_view_cubit.dart';
import 'package:planning_app/features/tasks/ui/views/task_day_view.dart';

class TaskDayViewBlocProvider extends StatelessWidget {
  const TaskDayViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as TasksDayEntity;
    return BlocProvider(
      create: (_) => TasksDayViewCubit(arguments),
      child: const TaskDayView(),
    );
  }
}
