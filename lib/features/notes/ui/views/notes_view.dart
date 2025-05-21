// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:planning_app/core/di/locator.dart';
// import 'package:planning_app/features/notes/add_note/ui/views/add_note_view.dart';
// import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_cubit.dart';
// import 'package:planning_app/features/notes/ui/widgets/folders_horizontal_listview.dart';

// class NotesView extends StatelessWidget {
//   const NotesView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context, rootNavigator: true)
//               .pushNamed(AddNoteView.routeName);
//         },
//         child: Icon(Icons.add),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 10.0,
//           ),
//           child: Column(
//             children: [
//               BlocProvider.value(
//                 value: locator<FoldersCubit>(),
//                 child: FoldersHorizontalListview(),
//               ),
//               Gap(10),
//               //  Expanded(child: NotesStaggeredGridView()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
