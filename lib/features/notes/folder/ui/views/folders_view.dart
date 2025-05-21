import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_cubit.dart';
import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_state.dart';
import 'package:planning_app/features/notes/folder/ui/widgets/folders_row.dart';
import 'package:planning_app/features/notes/ui/views/notes_staggered_grid_view.dart';

class FoldersView extends StatelessWidget {
  const FoldersView({super.key});

  @override
  Widget build(BuildContext context) {
    final FoldersCubit foldersCubit = context.read<FoldersCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: BlocBuilder<FoldersCubit, FoldersState>(
          buildWhen: (previous, current) {
            if (current is GetAllFoldersAndNotesSuccess ||
                current is SelectFolder) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state is GetAllFoldersAndNotesSuccess) {
              return Column(
                children: [
                  const FoldersRow(),
                  const Gap(10),
                  Expanded(
                    child: NotesStaggeredGridView(
                      notes: foldersCubit.allNotes,
                    ),
                  ),
                ],
              );
            } else if (state is SelectFolder) {
              return Column(
                children: [
                  const FoldersRow(),
                  const Gap(10),
                  Expanded(
                    child: NotesStaggeredGridView(
                      notes: state.selectedFolderIndex == 0
                          ? foldersCubit.allNotes
                          : state.folderEntity.notes ?? [],
                    ),
                  ),
                ],
              );
            } else if (state is Error) {
              return const Center(
                child: Text(
                  'An error occurred. Please try again.',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              );
            } else {
              return const Center(
                child: SizedBox(
                  width: 200,
                  height: 300,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
