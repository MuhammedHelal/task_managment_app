import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/core/widgets/dashed_divider.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_tile_cubit/task_tile_cubit.dart';

class TaskTileTime extends StatelessWidget {
  const TaskTileTime({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TaskTileCubit>(context);
    return Row(
      children: [
        Text(formatTimeOfDay(cubit.state.taskEntity.startTime)),
        const Gap(8),
        const Expanded(child: DashedDivider()),
        const Gap(8),
        Text(formatTimeOfDay(cubit.state.taskEntity.endTime)),
        const Gap(26),
      ],
    );
  }
}
