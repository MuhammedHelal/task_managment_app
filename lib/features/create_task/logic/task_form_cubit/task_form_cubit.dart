// task_form_cubit.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/core/utils/strings.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';
import 'package:planning_app/features/create_task/data/models/task_entity.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/create_task/logic/task_form_cubit/task_form_state.dart';

class TaskFormCubit extends Cubit<TaskFormState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  TaskFormCubit()
      : super(
          TaskFormState(
            currentMonth: DateTime.now(),
            startTime: const TimeOfDay(hour: 18, minute: 0),
            endTime: const TimeOfDay(hour: 21, minute: 0),
            priority: Priority.low,
            selectedDate: DateTime.now(),
          ),
        );

  void changeMonth(int delta) {
    final newMonth =
        DateTime(state.currentMonth.year, state.currentMonth.month + delta);
    emit(state.copyWith(
      currentMonth: newMonth,
      selectedDate: _shouldKeepDate(newMonth) ? state.selectedDate : null,
    ));
  }

  bool _shouldKeepDate(DateTime newMonth) {
    return state.selectedDate != null &&
        state.selectedDate!.month == newMonth.month &&
        state.selectedDate!.year == newMonth.year;
  }

  void selectDate(DateTime date) => emit(state.copyWith(selectedDate: date));

  void updateStartTime(TimeOfDay time) => emit(state.copyWith(startTime: time));

  void updateEndTime(TimeOfDay time) => emit(state.copyWith(endTime: time));

  void updatePriority(Priority priority) => emit(
        state.copyWith(priority: priority),
      );

  void submitForm() {
    if (descriptionController.text.isEmpty ||
        titleController.text.isEmpty ||
        state.selectedDate == null) {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: 'Please fill all required fields',
        ),
      );
    } else {
      _addTask();
      emit(state.copyWith(formStatus: FormStatus.success));
    }
  }

  void _addTask() async {
    print('[_addTask] submitting form');
    final box = Hive.box<TasksDayEntity>(AppStrings.tasksDaysBox);
    final formattedDate = getDateAtMidnight(state.selectedDate!);
    print('[_addTask] date: $formattedDate');
    final taskDay = box.get(formattedDate);
    print('[_addTask] taskDay: $taskDay');
    if (taskDay != null) {
      print('[_addTask] updating taskDay');
      final newTaskDay = taskDay.copyWith(
        tasks: [
          ...taskDay.tasks,
          TaskEntity(
            title: titleController.text,
            description: descriptionController.text,
            startTime: state.startTime.toString(),
            endTime: state.endTime.toString(),
            priority: state.priority,
          ),
        ],
      );
      await box.put(formattedDate, newTaskDay);
      print('[_addTask] updated taskDay: $newTaskDay');
    } else {
      print('[_addTask] creating new taskDay');
      final newTaskDay = TasksDayEntity(
        date: formattedDate,
        tasks: [
          TaskEntity(
            title: titleController.text,
            description: descriptionController.text,
            startTime: state.startTime.toString(),
            endTime: state.endTime.toString(),
            priority: state.priority,
          ),
        ],
      );
      await box.put(formattedDate, newTaskDay);
      print('[_addTask] created new taskDay: $newTaskDay');
    }
  }
}

String formatDate(DateTime date) {
  return DateFormat('MMMM dd').format(date);
}
