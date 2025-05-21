// Cubit Implementation
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/logic/task_form_cubit/task_form_cubit.dart';
import 'package:planning_app/features/create_task/ui/views/create_task_view.dart';

class TaskFormCubitProvider extends StatelessWidget {
  const TaskFormCubitProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskFormCubit(),
      child: const TaskFormView(),
    );
  }
}
