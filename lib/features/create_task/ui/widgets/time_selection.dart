import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/logic/create_task_cubit/create_task_cubit.dart';
import 'package:planning_app/features/create_task/logic/create_task_cubit/create_task_state.dart';

class TimeSelectionWidget extends StatelessWidget {
  const TimeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _TimeButton(isStartTime: true)),
            SizedBox(width: 16),
            Expanded(child: _TimeButton(isStartTime: false)),
          ],
        ),
      ],
    );
  }
}

class _TimeButton extends StatelessWidget {
  final bool isStartTime;
  const _TimeButton({required this.isStartTime});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      builder: (context, state) {
        final time = isStartTime ? state.startTime : state.endTime;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isStartTime ? 'Start Time' : 'End Time',
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 4),
            OutlinedButton(
              onPressed: () => _selectTime(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time, size: 18),
                  const SizedBox(width: 8),
                  Text(_formatTime(time)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final cubit = context.read<CreateTaskCubit>();
    final initialTime =
        isStartTime ? cubit.state.startTime : cubit.state.endTime;
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null) {
      isStartTime ? cubit.updateStartTime(picked) : cubit.updateEndTime(picked);
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}
