import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/notes/folder/data/models/folder_entity.dart';
import 'package:planning_app/features/notes/folder/data/models/note_entity.dart';
import 'package:planning_app/features/notes/folder/data/repos/folders_repo.dart';
import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_state.dart';

class FoldersCubit extends Cubit<FoldersState> {
  FoldersCubit(this.foldersRepo) : super(const FoldersState.initial());
  final FoldersRepo foldersRepo;
  List<FolderEntity> allFolders = [
    FolderEntity(name: 'Personal'),
    FolderEntity(name: 'Work'),
    FolderEntity(name: 'Work'),
    FolderEntity(name: 'Work', notes: [
      NoteEntity(title: 'Note 4', description: 'Description 4'),
      NoteEntity(title: 'Note 4', description: 'Description 4'),
      NoteEntity(title: 'Note 4', description: 'Description 4'),
      NoteEntity(title: 'Note 4', description: 'Description 4'),
    ]),
    FolderEntity(name: 'Work'),
  ];
  List<NoteEntity> allNotes = [];
  List<NoteEntity> getAllNotes({required List<FolderEntity> allFolders}) {
    List<NoteEntity> allNotes = [];

    for (final folder in allFolders) {
      if (folder.notes != null) {
        allNotes.addAll(folder.notes!);
      }
    }
    return allNotes;
  }

  // FolderEntity get selectedFolder => allFolders[selectedFolderIndex];
  int selectedFolderIndex = 0;
  Future<void> getAllFolders() async {
    try {
      allFolders = await foldersRepo.getFolders();
      allNotes = getAllNotes(allFolders: allFolders);
      emit(const FoldersState.getAllFoldersAndNotesSuccess());
    } catch (e) {
      emit(FoldersState.error(e.toString()));
    }
  }

  void selectFolder({
    required FolderEntity selectedFolder,
    required int index,
  }) {
    emit(FoldersState.selectFolder(
      folderEntity: selectedFolder,
      selectedFolderIndex: index,
    ));
  }
}
