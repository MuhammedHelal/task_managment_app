import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/core/utils/text_styles.dart';
import 'package:planning_app/features/tasks/logic/cubits/cubit/tasks_cubit.dart';

class YesterdayTodayTomorrowRow extends StatelessWidget {
  const YesterdayTodayTomorrowRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TasksCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            cubit.selectYesterday();
          },
          child: const DayButton(
            title: 'Yesterday',
          ),
        ),
        GestureDetector(
          onTap: () {
            cubit.selectToday();
          },
          child: const DayButton(
            title: 'Today',
          ),
        ),
        GestureDetector(
          onTap: () {
            cubit.selectTomorrow();
          },
          child: const DayButton(
            title: 'Tomorrow',
          ),
        ),
      ],
    );
  }
}

class DayButton extends StatelessWidget {
  const DayButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.taskColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TaskTextStyles.black16W300,
        ),
      ),
    );
  }

  /* String getFormattedDatetime(DateTime date) {
    bool isTheCurrentDayisToday = isToday(date);
    if (isTheCurrentDayisToday) {
      return 'Today';
    } else if (isYesterday(date)) {
      return 'Yesterday';
    } else if (isTomorrow(date)) {
      return 'Tomorrow';
    } else {
      return getWeekDayAndFormattedDate(date);
    }
  }*/
}
