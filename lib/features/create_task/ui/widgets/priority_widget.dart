import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';
import 'package:planning_app/features/create_task/logic/task_form_cubit/task_form_cubit.dart';
import 'package:planning_app/features/create_task/logic/task_form_cubit/task_form_state.dart';

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
    return BlocBuilder<TaskFormCubit, TaskFormState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: Priority.values.map((priority) {
            return ChoiceChip(
              label: Text(priority.name),
              selected: state.priority == priority,
              onSelected: (_) =>
                  context.read<TaskFormCubit>().updatePriority(priority),
              selectedColor: _getPriorityColor(priority),
              labelStyle: TextStyle(
                color: state.priority == priority ? Colors.white : Colors.black,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Color _getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.high:
        return Colors.red;
      case Priority.medium:
        return Colors.orange;
      case Priority.low:
        return Colors.green;
    }
  }
}
