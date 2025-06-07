import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_tile_cubit/task_tile_cubit.dart';
import 'package:planning_app/features/tasks/ui/widgets/mixed_corner_clipper.dart';
import 'package:planning_app/features/tasks/ui/widgets/task_tile_completed_checkbox.dart';
import 'package:planning_app/features/tasks/ui/widgets/task_tile_time.dart';

class TaskTileTopContainer extends StatelessWidget {
  const TaskTileTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TaskTileCubit>(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          ClipPath(
            clipper: MixedCornerClip(),
            child: Container(
              width: 125,
              height: 75,
              color: getPriorityColor(cubit.state.taskEntity.priority)
                  .withOpacity(0.2),
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: const TaskTileCompletedCheckBox(),
            ),
          ),
          const Expanded(child: TaskTileTime()),
        ],
      ),
    );
  }
}
