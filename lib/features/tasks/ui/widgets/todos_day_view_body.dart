import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/utils/consts.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_tile.dart';

class TodosDayViewBody extends StatelessWidget {
  const TodosDayViewBody({super.key, required this.todosDayEntity});

  final TasksDayEntity todosDayEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConsts.screenPadding),
        child: ListView.builder(
          itemCount: todosDayEntity.tasks.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                TodoTile(
                  todosDayEntity: todosDayEntity,
                  index: index,
                ),
                const Gap(5),
                const Divider(
                  thickness: 0,
                ),
                const Gap(5),
              ],
            );
          },
        ),
      ),
    );
  }
}
