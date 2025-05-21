import 'package:hive/hive.dart';
import 'package:planning_app/core/utils/strings.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';

class TasksRepo {
  Future<List<TasksDayEntity>> getAllTodoDays() async {
    final box = Hive.box<TasksDayEntity>(AppStrings.tasksDaysBox);
    return box.values.toList();
  }

  // Future<void> toggleIsCompleted({
  //   required int todoEntityIndex,
  //   required String currentDateKey,
  // }) async {
  //   print(
  //       '[toggleIsCompleted] START - index: $todoEntityIndex, dateKey: $currentDateKey');

  //   final box = Hive.box<TasksDayEntity>(AppStrings.tasksDaysBox);
  //   print('[toggleIsCompleted] Hive box opened: ${box.name}');

  //   // First check if the box has any data at all
  //   if (box.isEmpty) {
  //     print('[toggleIsCompleted] CRITICAL: The entire todo box is empty!');
  //     return;
  //   }

  //   final valueToChange = box.get(currentDateKey);
  //   print(
  //       '[toggleIsCompleted] Retrieved value for key $currentDateKey: ${valueToChange?.toString()}');

  //   if (valueToChange == null) {
  //     // Get all available dates to help debug what dates actually exist
  //     final availableDates = box.keys.toList();
  //     print('[toggleIsCompleted] Available dates in box: $availableDates');

  //     // Check if the date format might be wrong
  //     final today = DateTime.now().toString();
  //     print('[toggleIsCompleted] Current date for comparison: $today');

  //     print(
  //         '[toggleIsCompleted] ERROR: No todos found for date $currentDateKey - creating new entry');

  //     // Initialize a new entry if desired
  //     await box.put(
  //       currentDateKey,
  //       TodosDayEntity(
  //         dateTime: currentDateKey,
  //         todos: [], // Initialize with empty list or default todos
  //       ),
  //     );
  //     return;
  //   }

  //   final todos = valueToChange.todos;
  //   print(
  //       '[toggleIsCompleted] Found ${todos.length} todos for date $currentDateKey');

  //   if (todoEntityIndex >= todos.length || todoEntityIndex < 0) {
  //     print(
  //         '[toggleIsCompleted] ERROR: Invalid index $todoEntityIndex (list length: ${todos.length})');
  //     print('[toggleIsCompleted] Current todos: $todos');
  //     return;
  //   }

  //   final todo = todos[todoEntityIndex];
  //   final oldStatus = todo.isCompleted;
  //   todo.isCompleted = !oldStatus;
  //   print(
  //       '[toggleIsCompleted] Toggled "${todo.title}" (index $todoEntityIndex) from $oldStatus to ${todo.isCompleted}');

  //   try {
  //     await box.put(
  //       currentDateKey,
  //       TodosDayEntity(dateTime: currentDateKey, todos: todos),
  //     );
  //     print('[toggleIsCompleted] Successfully updated todo at $currentDateKey');
  //   } catch (e) {
  //     print('[toggleIsCompleted] ERROR saving to box: $e');
  //     rethrow;
  //   }

  //   print('[toggleIsCompleted] COMPLETE');
  // }
}
