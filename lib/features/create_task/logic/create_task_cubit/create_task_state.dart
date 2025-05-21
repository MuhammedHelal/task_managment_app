// task_form_state.dart

import 'package:flutter/material.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';

enum FormStatus { initial, loading, success, error }

class CreateTaskState {
  final DateTime currentMonth;
  final DateTime? selectedDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Priority priority;
  final FormStatus formStatus;
  final String? errorMessage;

  CreateTaskState({
    required this.currentMonth,
    this.selectedDate,
    required this.startTime,
    required this.endTime,
    required this.priority,
    this.formStatus = FormStatus.initial,
    this.errorMessage,
  });

  CreateTaskState copyWith({
    DateTime? currentMonth,
    DateTime? selectedDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    Priority? priority,
    FormStatus? formStatus,
    String? errorMessage,
  }) {
    return CreateTaskState(
      currentMonth: currentMonth ?? this.currentMonth,
      selectedDate: selectedDate ?? this.selectedDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      priority: priority ?? this.priority,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
