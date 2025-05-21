import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:planning_app/features/create_task/logic/task_form_cubit/task_form_cubit.dart';
import 'package:planning_app/features/create_task/logic/task_form_cubit/task_form_state.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFormCubit, TaskFormState>(
      builder: (context, state) {
        final days = _generateDaysInMonth(state.currentMonth);
        return SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) => _CalendarDayItem(
              date: days[index],
              isSelected: days[index] == state.selectedDate,
            ),
          ),
        );
      },
    );
  }

  List<DateTime> _generateDaysInMonth(DateTime month) {
    final lastDay = DateTime(month.year, month.month + 1, 0);
    return List.generate(
        lastDay.day, (i) => DateTime(month.year, month.month, i + 1));
  }
}

class _CalendarDayItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const _CalendarDayItem({required this.date, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final isToday = _isSameDay(date, DateTime.now());
    return GestureDetector(
      onTap: () => context.read<TaskFormCubit>().selectDate(date),
      child: Container(
        width: 42,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('E').format(date),
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date.day.toString(),
              style: TextStyle(
                fontSize: 16,
                color: isSelected
                    ? Colors.white
                    : isToday
                        ? Colors.blue
                        : Colors.black,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
