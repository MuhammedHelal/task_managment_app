import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/core/utils/text_styles.dart';
import 'package:planning_app/features/tasks/logic/cubits/cubit/tasks_cubit.dart';
import 'package:planning_app/features/tasks/ui/widgets/yesterday_today_tomorrow_row.dart';

class TasksCalender extends StatelessWidget {
  const TasksCalender({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TasksCubit>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<TasksCubit, TasksState>(builder: (context, state) {
            return OutlinedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  currentDate: DateTime.now(),
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                );
                if (selectedDate != null) {
                  cubit.selectDate(selectedDate.toString());
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDate(state.selectedDate),
                    textAlign: TextAlign.start,
                    style: TaskTextStyles.black16W500,
                  ),
                  const Icon(Icons.arrow_outward),
                ],
              ),
            );
          }),
          const YesterdayTodayTomorrowRow(),
        ],
      ),
    );
  }
}
