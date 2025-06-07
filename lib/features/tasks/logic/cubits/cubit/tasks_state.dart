part of 'tasks_cubit.dart';

enum TasksStatus {
  initial,
  getAllTasksDaysSuccess,
  getAllTasksDaysError,
  toggleTaskCompletionError,
}

class TasksState {
  final List<TasksDayEntity> tasksDays;
  final TasksStatus status;
  final String? errMessage;
  final String selectedDate;

  final int selectedDateIndex;

  const TasksState({
    required this.selectedDateIndex,
    required this.status,
    this.errMessage,
    required this.tasksDays,
    required this.selectedDate,
  });

  TasksState copyWith({
    TasksStatus? status,
    List<TasksDayEntity>? tasksDays,
    String? selectedDate,
    String? errMessage,
    int? selectedDateIndex,
  }) {
    return TasksState(
      selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
      selectedDate: selectedDate ?? this.selectedDate,
      errMessage: errMessage ?? this.errMessage,
      status: status ?? this.status,
      tasksDays: tasksDays ?? this.tasksDays,
    );
  }
}
