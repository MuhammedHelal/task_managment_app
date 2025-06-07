import 'package:planning_app/features/create_task/data/models/task_entity.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';

enum TaskDayViewStatus { initial, loading, success, error }

class TaskDayViewState {
  TaskDayViewState({
    this.status = TaskDayViewStatus.initial,
    required this.tasksDayEntity,
  });
  final TaskDayViewStatus status;
  final TasksDayEntity tasksDayEntity;

  TaskDayViewState copyWith({
    TaskDayViewStatus? status,
    TaskEntity? taskEntity,
  }) {
    return TaskDayViewState(
      status: status ?? this.status,
      tasksDayEntity: tasksDayEntity ?? tasksDayEntity,
    );
  }
}
