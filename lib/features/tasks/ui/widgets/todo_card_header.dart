import 'package:flutter/material.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/core/utils/text_styles_old.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/ui/views/task_day_view.dart';

class TodoCardHeader extends StatelessWidget {
  const TodoCardHeader({
    super.key,
    required this.tasksDayEntity,
  });
  final TasksDayEntity tasksDayEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 0,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'To-Do List',
              style: AppTextStyles.black25Bold,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                  TaskDayView.routeName,
                  arguments: tasksDayEntity,
                );
              },
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.black,
                ),
                child:
                    const Icon(Icons.arrow_outward_sharp, color: Colors.white),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            getWeekDayAndFormattedDate(
              DateTime.parse(tasksDayEntity.date),
            ),
            style: AppTextStyles.black14,
          ),
        ),
      ],
    );
  }
}
