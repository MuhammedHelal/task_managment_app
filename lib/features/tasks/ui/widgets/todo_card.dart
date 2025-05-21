import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_card_header.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_tile.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todosDayEntity});
  final TasksDayEntity todosDayEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.todoColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TodoCardHeader(tasksDayEntity: todosDayEntity),
          const Gap(20),
          ...List.generate(
            todosDayEntity.tasks.length,
            (index) {
              return TodoTile(
                todosDayEntity: todosDayEntity,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
