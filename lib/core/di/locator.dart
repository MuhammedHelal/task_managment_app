import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:planning_app/core/networking/api_service.dart';
import 'package:planning_app/core/networking/dio_factory.dart';
import 'package:planning_app/features/notes/folder/data/repos/folders_repo.dart';
import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_cubit.dart';
import 'package:planning_app/features/notes/logic/notes_cubit/notes_cubit.dart';
import 'package:planning_app/features/notes/logic/repos/add_note_repo.dart';
import 'package:planning_app/features/quote/data/repos/quote_repo.dart';
import 'package:planning_app/features/quote/logic/cubit/quote_cubit.dart';
import 'package:planning_app/features/tasks/logic/cubits/cubit/tasks_cubit.dart';
import 'package:planning_app/features/tasks/logic/repos/tasks_repo.dart';

final locator = GetIt.instance;
Future<void> setupLocator() async {
  // Network
  Dio dio = DioFactory.getDio();
  locator.registerLazySingleton<ApiService>(() => ApiService(dio));

  locator.registerLazySingleton<QuoteRepo>(() => QuoteRepo(locator()));
  locator.registerLazySingleton<QuoteCubit>(() => QuoteCubit(locator()));

  locator.registerLazySingleton<NotesRepo>(() => NotesRepo());
  locator.registerLazySingleton<NotesCubit>(
    () => NotesCubit(locator())..getAllNotes(),
  );

  locator.registerLazySingleton<FoldersRepo>(() => FoldersRepo());
  locator.registerLazySingleton<FoldersCubit>(
    () => FoldersCubit(locator())..getAllFolders(),
  );

  locator.registerLazySingleton<TasksCubit>(
    () => TasksCubit(locator<TasksRepo>()),
  );

  locator.registerLazySingleton<TasksRepo>(() => TasksRepo());
  // locator.registerLazySingleton<TasksListCubit>(
  //   () => TasksListCubit(locator()),
  // );
}
