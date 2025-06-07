import 'package:planning_app/features/create_task/data/models/task_entity.dart';

class TaskTileState {
  final TaskEntity taskEntity;

  TaskTileState({required this.taskEntity});

  TaskTileState copyWith({
    TaskEntity? taskEntity,
  }) {
    return TaskTileState(taskEntity: taskEntity ?? this.taskEntity);
  }
}
