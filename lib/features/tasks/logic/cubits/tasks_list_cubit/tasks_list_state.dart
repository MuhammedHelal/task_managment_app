import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';

enum TasksListStatus {
  initial,
  loading,
  success,
  error,
}

class TasksListState {
  final DateTime selectedDate;
  final TasksListStatus status;
  final List<TasksDayEntity> tasksDays;
  final String? errMessage;
  TasksListState({
    required this.status,
    required this.selectedDate,
    required this.errMessage,
    required this.tasksDays,
  });

  TasksListState copyWith({
    DateTime? selectedDate,
    TasksListStatus? status,
    String? errMessage,
    List<TasksDayEntity>? tasksDays,
  }) {
    return TasksListState(
      selectedDate: selectedDate ?? this.selectedDate,
      status: status ?? this.status,
      tasksDays: tasksDays ?? this.tasksDays,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}
