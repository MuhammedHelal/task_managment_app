import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/features/create_task/data/models/task_entity.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/logic/repos/tasks_repo.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(this.tasksRepo)
      : super(
          TasksState(
            selectedDate: getDateAtMidnight(DateTime.now().toString()),
            status: TasksStatus.initial,
            selectedDateIndex: 0,
            tasksDays: [],
          ),
        );
  final TasksRepo tasksRepo;
  final PageController pageController = PageController(
    viewportFraction: 0.85,
  );
  final ScrollController scrollController = ScrollController();

  void onPageChanged(int index) async {
    emit(
      state.copyWith(
        selectedDateIndex: index,
        selectedDate: state.tasksDays[index].date,
      ),
    );
  }

  Future<void> toggleTaskCompletion({required TaskEntity taskEntity}) async {
    final date = getDateAtMidnight(state.selectedDate);
    try {
      tasksRepo.toggleIsCompleted(
        taskEntity: taskEntity,
        currentDateKey: date,
      );
      final task = taskEntity.copyWith(isCompleted: !taskEntity.isCompleted);

      emit(
        state.copyWith(
          tasksDays: state.tasksDays.map((taskDay) {
            if (taskDay.date == date) {
              return taskDay.copyWith(
                  tasks: taskDay.tasks.map((t) {
                if (t == taskEntity) {
                  return task;
                }
                return t;
              }).toList());
            }
            return taskDay;
          }).toList(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TasksStatus.toggleTaskCompletionError,
          errMessage: e.toString(),
        ),
      );
    }
    // getAllTasksDays();
  }

  void selectDate(String date) {
    pageController.animateToPage(
      _getSelectedDateIndex(date) ?? _getTodayIndex() ?? 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(state.copyWith(selectedDate: date));
  }

  void selectYesterday() {
    final date = DateTime.now().subtract(const Duration(days: 1)).toString();
    final yesterdayDate = getDateAtMidnight(date);
    selectDate(yesterdayDate);
  }

  void selectTomorrow() {
    final date = DateTime.now().add(const Duration(days: 1)).toString();
    final tomorrowDate = getDateAtMidnight(date);
    selectDate(tomorrowDate);
  }

  void selectToday() {
    final date = DateTime.now().toString();
    final todayDate = getDateAtMidnight(date);
    selectDate(todayDate);
  }

  void getAllTasksDays() async {
    try {
      final result = await tasksRepo.getAllTasksDays();
      //  initPageController();
      emit(
        state.copyWith(
          tasksDays: result,
          status: TasksStatus.getAllTasksDaysSuccess,
        ),
      );
      jumpToSelectedDate(selectedDate: DateTime.now().toString());
    } catch (e) {
      emit(
        state.copyWith(
          status: TasksStatus.getAllTasksDaysError,
          errMessage: e.toString(),
        ),
      );
      // emit(Error(e.toString()));
    }
  }

  void jumpToSelectedDate({required String selectedDate}) async {
    print('animateToSelectedDate: selectedDate $selectedDate');
    int? index = getSelectedDateIndex(selectedDate);
    print('animateToSelectedDate: index $index');
    int initialIndex = index ?? getTodayIndex() ?? 0;
    print('animateToSelectedDate: initialIndex $initialIndex');
    pageController.jumpToPage(initialIndex);
  }

  int? getSelectedDateIndex(selectedDate) {
    final date = getDateAtMidnight(selectedDate);
    print('_getSelectedDateIndex: date $date');
    for (int i = 0; i < state.tasksDays.length; i++) {
      final todoDay = state.tasksDays[i];
      print('_getSelectedDateIndex: todoDay.date ${todoDay.date}');
      if (isTwoDaysAreEqual(
        DateTime.parse(todoDay.date),
        DateTime.parse(date),
      )) {
        print('_getSelectedDateIndex: index $i');
        return i;
      }
    }
    print('_getSelectedDateIndex: not found');
    return null;
  }

  int? getTodayIndex() {
    final tasksDaysList = state.tasksDays;
    for (int i = 0; i < tasksDaysList.length; i++) {
      final todoDay = tasksDaysList[i];
      if (isToday(DateTime.parse(todoDay.date))) {
        return i;
      }
    }
    return null;
  }

  int? _getSelectedDateIndex(selectedDate) {
    final date = getDateAtMidnight(selectedDate);
    print('_getSelectedDateIndex: date $date');
    for (int i = 0; i < state.tasksDays.length; i++) {
      final todoDay = state.tasksDays[i];
      print('_getSelectedDateIndex: todoDay.date ${todoDay.date}');
      if (isTwoDaysAreEqual(
        DateTime.parse(todoDay.date),
        DateTime.parse(date),
      )) {
        print('_getSelectedDateIndex: index $i');
        return i;
      }
    }
    print('_getSelectedDateIndex: not found');
    return null;
  }

  int? _getTodayIndex() {
    final tasksDaysList = state.tasksDays;
    for (int i = 0; i < tasksDaysList.length; i++) {
      final todoDay = tasksDaysList[i];
      if (isToday(DateTime.parse(todoDay.date))) {
        return i;
      }
    }
    return null;
  }
}
