import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_card_header.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_tile.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.tasksDayEntity});
  final TasksDayEntity tasksDayEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.taskColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TodoCardHeader(tasksDayEntity: tasksDayEntity),
          const Gap(20),
          Expanded(
            child: ListView.builder(
              itemCount: tasksDayEntity.tasks.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskEntity: tasksDayEntity.tasks[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
