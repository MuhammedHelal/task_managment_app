import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:planning_app/core/di/locator.dart';
import 'package:planning_app/core/utils/bloc_observer.dart';
import 'package:planning_app/core/utils/strings.dart';
import 'package:planning_app/features/create_task/data/enums/priority.dart';
import 'package:planning_app/features/create_task/data/models/task_entity.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/notes/folder/data/models/folder_entity.dart';
import 'package:planning_app/features/notes/folder/data/models/note_entity.dart';
import 'package:planning_app/planning_app.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();

  _registerHiveAdapters();
  await _openHiveBoxes();
  setupLocator();

  // _checkIsFirstRunAndAddDummyData();
  await ScreenUtil.ensureScreenSize();

  runApp(const PlanningApp());
}

Future<void> _openHiveBoxes() async {
  await Future.wait([
    Hive.openBox<FolderEntity>(AppStrings.foldersBox),
    Hive.openBox<TasksDayEntity>(AppStrings.tasksDaysBox),
  ]);
}

void _registerHiveAdapters() {
  Hive.registerAdapter(NoteEntityAdapter());
  Hive.registerAdapter(FolderEntityAdapter());
  // Hive.registerAdapter(TodoEntityAdapter());
  //  Hive.registerAdapter(TodosDayEntityAdapter());
  Hive.registerAdapter(TaskEntityAdapter());

  Hive.registerAdapter(TasksDayEntityAdapter());

  Hive.registerAdapter(PriorityAdapter());
}

// void _checkIsFirstRunAndAddDummyData() {
//   final foldersBox = Hive.box<FolderEntity>(AppStrings.foldersBox);
//   final todoDaysBox = Hive.box<TasksDayEntity>(AppStrings.tasksDaysBox);
//   if (todoDaysBox.isEmpty) {
//     todoDaysBox.put(
//       getDateAtMidnight(DateTime.now().subtract(Duration(days: 2))),
//       TasksDayEntity(
//         date: getDateAtMidnight(DateTime.now().subtract(Duration(days: 2))),
//         tasks: [
//           TaskEntity(description: 'Work -2'),
//           TodoEntity(title: 'Learn -2'),
//         ],
//       ),
//     );
//     todoDaysBox.put(
//       getDateAtMidnight(DateTime.now().subtract(Duration(days: 1))),
//       TodosDayEntity(
//         dateTime: getDateAtMidnight(DateTime.now().subtract(Duration(days: 1))),
//         todos: [
//           TodoEntity(title: 'Work -1'),
//           TodoEntity(title: 'Learn -1'),
//         ],
//       ),
//     );
//     todoDaysBox.put(
//       getDateAtMidnight(DateTime.now()),
//       TodosDayEntity(dateTime: getDateAtMidnight(DateTime.now()), todos: [
//         TodoEntity(title: 'Work'),
//         TodoEntity(title: 'Learn'),
//       ]),
//     );

//     todoDaysBox.put(
//       getDateAtMidnight(DateTime.now().add(Duration(days: 1))),
//       TodosDayEntity(
//         dateTime: getDateAtMidnight(DateTime.now().add(Duration(days: 1))),
//         todos: [
//           TodoEntity(title: 'Work +1'),
//           TodoEntity(title: 'Learn +1'),
//         ],
//       ),
//     );
//     todoDaysBox.put(
//       getDateAtMidnight(DateTime.now().add(Duration(days: 2))),
//       TodosDayEntity(
//         dateTime: getDateAtMidnight(DateTime.now().add(Duration(days: 2))),
//         todos: [
//           TodoEntity(title: 'Work +2'),
//           TodoEntity(title: 'Learn +2'),
//         ],
//       ),
//     );
//   } else {
//     debugPrint('It is not first run, no need to add todos ');
//   }
//   debugPrint('Checking if it is first run');
//   if (foldersBox.isEmpty) {
//     debugPrint('It is first run, adding all notes folder');
//     foldersBox.add(FolderEntity(name: AppStrings.allNotesFolderName));
//     foldersBox.add(FolderEntity(name: 'Work', notes: [
//       NoteEntity(description: 'sdasd'),
//       NoteEntity(description: 'sssssssssssss'),
//       NoteEntity(description: 'sssssssssssss'),
//     ]));
//     foldersBox.add(FolderEntity(name: 'Education', notes: [
//       NoteEntity(description: 'sdasd'),
//       NoteEntity(description: 'sssssssssssss'),
//     ]));
//   } else {
//     debugPrint('It is not first run, no need to add all notes folder');
//   }
// }
