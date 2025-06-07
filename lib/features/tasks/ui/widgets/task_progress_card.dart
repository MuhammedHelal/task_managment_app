import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_day_view_cubit/task_day_view_cubit.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_day_view_cubit/task_day_view_state.dart';

class TaskProgressCard extends StatelessWidget {
  const TaskProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TasksDayViewCubit>(context);

    return BlocBuilder<TasksDayViewCubit, TaskDayViewState>(
      builder: (context, state) {
        final tasks = cubit.state.tasksDayEntity.tasks;
        double progress =
            tasks.where((todo) => todo.isCompleted).length / tasks.length;
        int completed = tasks.where((todo) => todo.isCompleted).length;
        int total = tasks.length;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Vertical pill progress bar
              Container(
                width: 20,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Text section
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$completed/$total',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'tasks',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
