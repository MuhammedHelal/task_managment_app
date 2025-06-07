import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/utils/text_styles.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_tile_cubit/task_tile_cubit.dart';

class TaskTileBottomContainer extends StatelessWidget {
  const TaskTileBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TaskTileCubit>(context);

    return Container(
      padding: const EdgeInsets.only(left: 16, bottom: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color:
            getPriorityColor(cubit.state.taskEntity.priority).withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cubit.state.taskEntity.title,
                style: TaskTextStyles.black16W500,
              ),
              IconButton(
                onPressed: () {
                  cubit.deleteTask();
                },
                icon: const Icon(Icons.delete_forever),
              ),
            ],
          ),
          if (cubit.state.taskEntity.description.isNotEmpty)
            Column(
              children: [
                const Gap(10),
                Text(
                  cubit.state.taskEntity.description,
                  style: TaskTextStyles.black14W300,
                ),
              ],
            ),
          const Gap(10),
        ],
      ),
    );
  }
}
