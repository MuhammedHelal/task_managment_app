import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/core/utils/text_styles_old.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/ui/widgets/task_progress_card.dart';

import '../widgets/todos_day_view_body.dart';

class TodoDayView extends StatelessWidget {
  const TodoDayView({super.key, required this.tasksDayEntity});
  static const routeName = '/todo-day-view';
  final TasksDayEntity tasksDayEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back_ios),
      //   ),

      //   backgroundColor: AppColors.todoColor,
      //   // todosDayEntity.dateTime,
      // ),
      body: Column(
        children: [
          CustomAppBar(tasksDayEntity: tasksDayEntity),
          TodosDayViewBody(todosDayEntity: tasksDayEntity),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.tasksDayEntity});
  final TasksDayEntity tasksDayEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.todoColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Text(
                  style: AppTextStyles.white20Bold,
                  getWeekDayAndFormattedDate(
                    DateTime.parse(tasksDayEntity.date),
                  ),
                ), // todosDayEntity.dateTime,
              ],
            ),
            const Gap(20),
            TaskProgressCard(tasks: tasksDayEntity.tasks),
          ],
        ),
      ),
    );
  }
}
