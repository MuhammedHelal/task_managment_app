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

  TaskEntity copyWith({
    String? title,
    String? description,
    String? startTime,
    String? endTime,
    Priority? priority,
    bool? isCompleted,
  }) {
    return TaskEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'TaskEntity{title: $title, description: $description, startTime: $startTime, endTime: $endTime, priority: $priority, isCompleted: $isCompleted}';
  }

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      priority.hashCode ^
      isCompleted.hashCode;
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TaskEntity &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          startTime == other.startTime &&
          endTime == other.endTime &&
          priority == other.priority &&
          isCompleted == other.isCompleted;
}
