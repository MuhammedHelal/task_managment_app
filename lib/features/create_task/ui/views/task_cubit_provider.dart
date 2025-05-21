// Cubit Implementation
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/logic/create_task_cubit/create_task_cubit.dart';
import 'package:planning_app/features/create_task/ui/views/create_task_view.dart';

class TaskFormCubitProvider extends StatelessWidget {
  const TaskFormCubitProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTaskCubit(),
      child: const CreateTaskView(),
    );
  }
}
