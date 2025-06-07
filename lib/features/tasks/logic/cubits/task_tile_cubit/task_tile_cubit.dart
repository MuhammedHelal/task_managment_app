import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/di/locator.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/features/create_task/data/models/task_entity.dart';
import 'package:planning_app/features/tasks/logic/cubits/cubit/tasks_cubit.dart';
import 'package:planning_app/features/tasks/logic/repos/tasks_repo.dart';

import 'task_tile_state.dart';

class TaskTileCubit extends Cubit<TaskTileState> {
  TaskTileCubit({
    required this.taskEntity,
    required this.tasksRepo,
  }) : super(TaskTileState(taskEntity: taskEntity));
  final TaskEntity taskEntity;
  final TasksRepo tasksRepo;
  void toggleIsCompleted() {
    final newIsCompletedStatus = !state.taskEntity.isCompleted;

    emit(
      state.copyWith(
        taskEntity: taskEntity.copyWith(isCompleted: newIsCompletedStatus),
      ),
    );
    tasksRepo.toggleIsCompleted(
      taskEntity: state.taskEntity,
      currentDateKey: getDateAtMidnight(
        locator<TasksCubit>().state.selectedDate,
        // locator<TasksListCubit>().state.selectedDate,
      ),
    );
  }

  void deleteTask() {
    emit(state.copyWith());
  }
}
