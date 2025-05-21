import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:planning_app/features/create_task/logic/create_task_cubit/create_task_cubit.dart';
import 'package:planning_app/features/create_task/logic/create_task_cubit/create_task_state.dart';

class MonthHeaderWidget extends StatelessWidget {
  const MonthHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('MMMM dd')
                  .format(state.selectedDate ?? DateTime.now()),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () =>
                      context.read<CreateTaskCubit>().changeMonth(-1),
                ),
                Text(
                  DateFormat('MMMM yyyy').format(state.currentMonth),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () =>
                      context.read<CreateTaskCubit>().changeMonth(1),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
