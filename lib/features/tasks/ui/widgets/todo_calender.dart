import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/utils/text_styles_old.dart';
import 'package:planning_app/features/tasks/logic/cubit/tasks_list_cubit.dart';
import 'package:planning_app/features/tasks/logic/cubit/tasks_list_state.dart';
import 'package:planning_app/features/tasks/ui/widgets/yesterday_today_tomorrow_row.dart';

class TodoCalender extends StatelessWidget {
  const TodoCalender({super.key});

  @override
  Widget build(BuildContext context) {
    final TasksListCubit todoCubit = context.read<TasksListCubit>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<TasksListCubit, TasksListState>(
              builder: (context, state) {
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
                  todoCubit.selectDate(selectedDate);
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Date',
                    textAlign: TextAlign.start,
                    style: TodoTextStyles.black16W500,
                  ),
                  Icon(Icons.arrow_outward),
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
