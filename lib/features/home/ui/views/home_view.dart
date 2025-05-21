import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/di/locator.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/core/utils/consts.dart';
import 'package:planning_app/features/home/ui/widgets/custom_speed_dial.dart';
import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_cubit.dart';
import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_state.dart';
import 'package:planning_app/features/notes/folder/ui/widgets/folders_row.dart';
import 'package:planning_app/features/notes/ui/views/notes_staggered_grid_view.dart';
import 'package:planning_app/features/quote/logic/cubit/quote_cubit.dart';
import 'package:planning_app/features/quote/ui/views/quote_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final FoldersCubit foldersCubit = context.read<FoldersCubit>();

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text(getTodayName()),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConsts.screenPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocProvider.value(
                value: locator<FoldersCubit>(),
                child: const FoldersRow(),
              ),
              const Gap(10),
              BlocProvider.value(
                value: locator<QuoteCubit>()..emitQuoteOfTheDayStates(),
                child: const QuoteView(),
              ),
              const Gap(10),

              //  TodoCard(),
              const Gap(10),

              BlocBuilder<FoldersCubit, FoldersState>(
                buildWhen: (previous, current) {
                  if (current is SelectFolder ||
                      current is GetAllFoldersAndNotesSuccess) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  if (state is SelectFolder) {
                    return BlocProvider.value(
                      value: locator<FoldersCubit>(),
                      child: NotesStaggeredGridView(
                        notes: state.folderEntity.notes ?? [],
                      ),
                    );
                  }
                  return BlocProvider.value(
                    value: locator<FoldersCubit>(),
                    child: NotesStaggeredGridView(
                      notes: foldersCubit
                              .allFolders[foldersCubit.selectedFolderIndex]
                              .notes ??
                          [],
                    ),
                  );
                },
              ),

              //   FoldersHorizontalListview(),
              //     NotesStaggeredGridView(),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomSpeedDial(),
    );
  }
}
