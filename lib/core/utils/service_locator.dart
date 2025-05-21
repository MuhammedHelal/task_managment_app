// import 'package:get_it/get_it.dart';
// import 'package:notes/features/home/data/data_sources/home_local_data_source.dart';
// import 'package:notes/features/home/data/repos/home_repo_impl.dart';
// import 'package:notes/features/home/pres/manager/home_content_cubit/home_content_cubit.dart';
// import 'package:notes/generated/l10n.dart';

// final locator = GetIt.instance;
// void setupServiceLocator() {
//   locator.registerSingleton<S>(S());
//   locator.registerLazySingleton<HomeRepoImpl>(
//     () => HomeRepoImpl(
//       homeLocalDataSource: HomeLocalDataSourceImpl(),
//     ),
//   );
//   locator.registerLazySingleton<HomeBodyCubit>(
//     () => HomeBodyCubit(locator<HomeRepoImpl>()),
//   );
// }
