import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/core/utils/strings.dart';
import 'package:planning_app/features/notes/folder/data/models/folder_entity.dart';
import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_cubit.dart';
import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_state.dart';
import 'package:planning_app/features/notes/folder/ui/widgets/folder_tile.dart';

class FoldersRow extends StatelessWidget {
  const FoldersRow({super.key});

  @override
  Widget build(BuildContext context) {
    final FoldersCubit foldersCubit = context.read<FoldersCubit>();

    return BlocBuilder<FoldersCubit, FoldersState>(
      buildWhen: (previous, current) {
        if (current is SelectFolder) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is SelectFolder) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                foldersCubit.allFolders.length,
                (index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        foldersCubit.selectFolder(
                          selectedFolder: foldersCubit.allFolders[index],
                          index: index,
                        );
                      },
                      child: FolderTile(
                        folderEntity: FolderEntity(
                          name: AppStrings.allNotesFolderName,
                          notes: foldersCubit.allNotes,
                        ),
                        isActive: state.selectedFolderIndex == 0,
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        foldersCubit.selectFolder(
                          selectedFolder: foldersCubit.allFolders[index],
                          index: index,
                        );
                      },
                      child: FolderTile(
                        folderEntity: foldersCubit.allFolders[index],
                        isActive: index == state.selectedFolderIndex,
                      ),
                    );
                  }
                },
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                foldersCubit.allFolders.length,
                (index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        foldersCubit.selectFolder(
                          selectedFolder: foldersCubit.allFolders[index],
                          index: index,
                        );
                      },
                      child: FolderTile(
                        folderEntity: FolderEntity(
                          name: AppStrings.allNotesFolderName,
                          notes: foldersCubit.allNotes,
                        ),
                        isActive: index == 0,
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        foldersCubit.selectFolder(
                          selectedFolder: foldersCubit.allFolders[index],
                          index: index,
                        );
                      },
                      child: FolderTile(
                        folderEntity: foldersCubit.allFolders[index],
                        isActive: index == 0,
                      ),
                    );
                  }
                },
              ),
            ),
          );
        }
      },
    );
  }
}
