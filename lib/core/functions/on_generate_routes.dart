import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/di/locator.dart';
import 'package:planning_app/features/create_task/ui/views/create_task_view.dart';
import 'package:planning_app/features/create_task/ui/views/task_cubit_provider.dart';
import 'package:planning_app/features/notes/folder/add_note/ui/views/add_note_view.dart';
import 'package:planning_app/features/notes/logic/notes_cubit/notes_cubit.dart';
import 'package:planning_app/presistent_bottom_navbar.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => const PersistentBottomNavbar(),
      );
    case TaskFormView.routeName:
      return MaterialPageRoute(
        builder: (context) => const TaskFormCubitProvider(),
      );
    // case TodoDayView.routeName:
    //   final todosDayEntity = settings.arguments as TodosDayEntity;
    //   return MaterialPageRoute(
    //     builder: (context) => BlocProvider.value(
    //       value: locator<TasksListCubit>(),
    //       child: TodoDayView(
    //         todosDayEntity: todosDayEntity,
    //       ),
    //     ),
    //   );
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
