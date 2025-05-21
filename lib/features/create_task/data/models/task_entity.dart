import 'package:hive/hive.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 4)
class TaskEntity {
  @HiveField(0)
  final String description;
  @HiveField(1)
  final String title;

  @HiveField(2)
  final String startTime;

  @HiveField(3)
  final String endTime;

  @HiveField(4)
  final Priority priority;
  @HiveField(5)
  bool isCompleted;

  TaskEntity({
    required this.title,
    this.isCompleted = false,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.priority,
  });
}
