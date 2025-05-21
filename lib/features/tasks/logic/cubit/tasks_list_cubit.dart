import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/features/tasks/logic/cubit/tasks_list_state.dart';
import 'package:planning_app/features/tasks/logic/repos/tasks_repo.dart';

class TasksListCubit extends Cubit<TasksListState> {
  TasksListCubit(this.tasksRepo)
      : super(TasksListState(
          selectedDate: DateTime.now(),
          errMessage: null,
          status: TasksListStatus.initial,
          tasksDays: [],
        )) {
    getAllTasksDays();

    // initSelectedDate();
    //  getCurrentTodosDayEntityIndex();
  }
  final TasksRepo tasksRepo;
  final PageController pageController = PageController(
    viewportFraction: 0.85,
  );
  void getAllTasksDays() async {
    try {
      final result = await tasksRepo.getAllTasksDays();
      //  initPageController();
      emit(
        state.copyWith(
          tasksDays: result,
          status: TasksListStatus.success,
        ),
      );
      jumpToSelectedDate(selectedDate: DateTime.now().toString());
    } catch (e) {
      emit(
        state.copyWith(
          status: TasksListStatus.error,
          errMessage: e.toString(),
        ),
      );
      // emit(Error(e.toString()));
    }
  }

  void updateTasks() async {
    try {
      final result = await tasksRepo.getAllTasksDays();
      emit(state.copyWith(tasksDays: result, status: TasksListStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: TasksListStatus.error,
        errMessage: e.toString(),
      ));
    }
  }
  // late ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  // void getCurrentTodosDayEntityIndex() {
  //   pageController.addListener(() {
  //     currentIndex.value = pageController.page?.round() ?? 0;
  //   });
  // }

  // void changeSelectedDate(int index) {
  //   final selectedDate = todoDaysList[index].dateTime;
  //   emit(SelectDate(date: selectedDate));
  // }

  void selectYesterday() {
    final date = DateTime.now().subtract(const Duration(days: 1));
    final yesterdayDate = getDateAtMidnight(date);
    selectDate(DateTime.parse(yesterdayDate));
  }

  void selectTomorrow() {
    final date = DateTime.now().add(const Duration(days: 1));
    final tomorrowDate = getDateAtMidnight(date);
    selectDate(DateTime.parse(tomorrowDate));
  }

  void selectToday() {
    final date = DateTime.now();
    final todayDate = getDateAtMidnight(date);
    selectDate(DateTime.parse(todayDate));
  }

  void selectDate(DateTime selectedDate) {
    // for (final todoDay in todoDaysList) {
    //   print('selectDate: todoDay.dateTime ${todoDay.dateTime}');
    //   if (isTwoDaysAreEqual(DateTime.parse(todoDay.dateTime), selectedDate)) {
    //     final index = todoDaysList.indexOf(todoDay);
    //     print('selectDate: pageController.jumpToPage $index');
    //     pageController.animateToPage(todoDaysList.indexOf(todoDay),
    //         duration: Duration(milliseconds: 300), curve: Curves.linear);
    //     return;
    //   }
    // }
  }

  // TodosDayEntity currentTodosDayEntity() {
  //   print(
  //       'currentTodosDayEntity: pageController.page ${pageController.page?.round() ?? 0}');
  //   print('currentTodosDayEntity: todoDaysList.length ${todoDaysList.length}');
  //   final currentTodosDayEntity =
  //       todoDaysList[pageController.page?.round() ?? 0];
  //   print('currentTodosDayEntity: $currentTodosDayEntity');

  //   return currentTodosDayEntity;
  // }

  // void toggleIsCompleted({
  //   required int todoIndex,
  //   required String currentSelectedDate,
  // }) async {
  //   try {
  //     await todoRepo.toggleIsCompleted(
  //       todoEntityIndex: todoIndex,
  //       currentDateKey: currentSelectedDate,
  //     );
  //   } catch (e) {
  //     emit(Error(e.toString()));
  //   }
  // }

  void animateToSelectedDate({required String selectedDate}) async {
    print('animateToSelectedDate: selectedDate $selectedDate');
    int? index = _getSelectedDateIndex(selectedDate);
    print('animateToSelectedDate: index $index');
    int initialIndex = index ?? _getTodayIndex() ?? 0;
    print('animateToSelectedDate: initialIndex $initialIndex');
    await pageController.animateToPage(
      initialIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void jumpToSelectedDate({required String selectedDate}) async {
    print('animateToSelectedDate: selectedDate $selectedDate');
    int? index = _getSelectedDateIndex(selectedDate);
    print('animateToSelectedDate: index $index');
    int initialIndex = index ?? _getTodayIndex() ?? 0;
    print('animateToSelectedDate: initialIndex $initialIndex');
    pageController.jumpToPage(initialIndex);
  }

  int? _getSelectedDateIndex(selectedDate) {
    final date = getDateAtMidnight(DateTime.parse(selectedDate));
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
