import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';
import 'package:planning_app/features/create_task/data/models/task_entity.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_day_view_cubit/task_day_view_state.dart';

class TasksDayViewCubit extends Cubit<TaskDayViewState> {
  final TasksDayEntity tasksDayEntity;
  TasksDayViewCubit(this.tasksDayEntity)
      : super(
          TaskDayViewState(tasksDayEntity: tasksDayEntity),
        );

  List<TaskEntity> orderTasksInPriorityAndTime(List<TaskEntity> oldTasks) {
    final lowPriority =
        oldTasks.where((task) => task.priority == Priority.low).toList();

    final mediumPriority =
        oldTasks.where((task) => task.priority == Priority.medium).toList();

    final highPriority =
        oldTasks.where((task) => task.priority == Priority.high).toList();

    highPriority.sort((a, b) => a.startTime.compareTo(b.startTime));
    mediumPriority.sort((a, b) => a.startTime.compareTo(b.startTime));
    lowPriority.sort((a, b) => a.startTime.compareTo(b.startTime));

    final tasks = [...highPriority, ...mediumPriority, ...lowPriority];

    return tasks;
  }
}
