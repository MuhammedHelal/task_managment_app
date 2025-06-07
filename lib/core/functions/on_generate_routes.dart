import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/di/locator.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/create_task/ui/views/create_task_view.dart';
import 'package:planning_app/features/create_task/ui/views/task_cubit_provider.dart';
import 'package:planning_app/features/notes/folder/add_note/ui/views/add_note_view.dart';
import 'package:planning_app/features/notes/logic/notes_cubit/notes_cubit.dart';
import 'package:planning_app/features/tasks/ui/views/task_day_view.dart';
import 'package:planning_app/features/tasks/ui/widgets/task_day_view_bloc_provider.dart';
import 'package:planning_app/presistent_bottom_navbar.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => const PersistentBottomNavbar(),
      );
    case CreateTaskView.routeName:
      return MaterialPageRoute(
        builder: (context) => const TaskFormCubitProvider(),
      );
    case TaskDayView.routeName:
      final tasksDayEntity = settings.arguments as TasksDayEntity;
      return MaterialPageRoute(
        builder: (context) => const TaskDayViewBlocProvider(),
        settings: RouteSettings(arguments: tasksDayEntity),
      );
    case AddNoteView.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: locator<NotesCubit>(),
          child: const AddNoteView(),
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Route not found'),
          ),
        ),
      );
  }
}
