import 'package:hive/hive.dart';
import 'package:planning_app/features/create_task/data/models/task_entity.dart';

part 'tasks_day_entity.g.dart';

@HiveType(typeId: 5)
class TasksDayEntity {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final List<TaskEntity> tasks;

  TasksDayEntity({
    required this.date,
    required this.tasks,
  });

  @override
  toString() => 'TasksDayEntity(date: $date, tasks: $tasks)';

  TasksDayEntity copyWith({
    List<TaskEntity>? tasks,
  }) {
    return TasksDayEntity(
      date: date,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  operator ==(other) =>
      identical(this, other) ||
      other is TasksDayEntity &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          tasks == other.tasks;

  @override
  int get hashCode => date.hashCode ^ tasks.hashCode;
}
