import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_tile_cubit/task_tile_cubit.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_tile_cubit/task_tile_state.dart';

class TaskTileCompletedCheckBox extends StatelessWidget {
  const TaskTileCompletedCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TaskTileCubit>(context);

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Transform.rotate(
          angle: (45) * (pi / 180),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: getPriorityColor(cubit.state.taskEntity.priority),
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: BlocBuilder<TaskTileCubit, TaskTileState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  cubit.toggleIsCompleted();
                },
                child: Icon(
                  size: 40,
                  state.taskEntity.isCompleted
                      ? Icons.check
                      : Icons.check_box_outline_blank,
                  color: getPriorityColor(cubit.state.taskEntity.priority),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
