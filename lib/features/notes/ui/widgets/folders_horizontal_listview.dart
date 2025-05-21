// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_cubit.dart';
// import 'package:planning_app/features/notes/folder/ui/widgets/folder_tile.dart';

// class FoldersHorizontalListview extends StatelessWidget {
//   const FoldersHorizontalListview({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final FoldersCubit foldersCubit = context.read<FoldersCubit>();

//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         mainAxisSize: MainAxisSize.min,
//         children: List.generate(
//           foldersCubit.allFolders.length,
//           (index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 6),
//               child: FolderTile(
//                 isActive: ,
//                 folderEntity: foldersCubit.allFolders[index],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
