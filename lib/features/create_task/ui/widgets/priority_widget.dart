import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';
import 'package:planning_app/features/create_task/logic/create_task_cubit/create_task_cubit.dart';
import 'package:planning_app/features/create_task/logic/create_task_cubit/create_task_state.dart';

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _PriorityChips(),
      ],
    );
  }
}

class _PriorityChips extends StatelessWidget {
  const _PriorityChips();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: Priority.values.map((priority) {
            return ChoiceChip(
              label: Text(priority.name),
              selected: state.priority == priority,
              onSelected: (_) =>
                  context.read<CreateTaskCubit>().updatePriority(priority),
              selectedColor: getPriorityColor(priority),
              labelStyle: TextStyle(
                color: state.priority == priority ? Colors.white : Colors.black,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
