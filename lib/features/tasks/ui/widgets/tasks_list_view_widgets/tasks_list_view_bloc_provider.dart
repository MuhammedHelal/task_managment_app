import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/di/locator.dart';
import 'package:planning_app/features/tasks/logic/cubits/cubit/tasks_cubit.dart';
import 'package:planning_app/features/tasks/ui/views/tasks_list_view.dart';

class TasksListViewBlocProvider extends StatelessWidget {
  const TasksListViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<TasksCubit>()..getAllTasksDays(),
      child: const TasksListView(),
    );
  }
}
