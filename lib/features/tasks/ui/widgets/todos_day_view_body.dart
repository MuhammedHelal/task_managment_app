import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/di/locator.dart';
import 'package:planning_app/core/utils/consts.dart';
import 'package:planning_app/core/widgets/dashed_divider.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_day_view_cubit/task_day_view_cubit.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_tile_cubit/task_tile_cubit.dart';
import 'package:planning_app/features/tasks/logic/repos/tasks_repo.dart';
import 'package:planning_app/features/tasks/ui/views/task_tile.dart';

class TodosDayViewBody extends StatelessWidget {
  const TodosDayViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TasksDayViewCubit>(context);

    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConsts.screenPadding),
        child: ListView.builder(
          itemCount: cubit.state.tasksDayEntity.tasks.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final tasks = cubit
                .orderTasksInPriorityAndTime(cubit.state.tasksDayEntity.tasks);
            return Column(
              children: [
                BlocProvider(
                  create: (context) => TaskTileCubit(
                    taskEntity: tasks[index],
                    tasksRepo: locator<TasksRepo>(),
                  ),
                  child: const TaskTile(),
                ),
                if (index != tasks.length - 1)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: DashedDivider(
                      height: 0.5,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
