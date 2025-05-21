import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planning_app/features/notes/folder/data/models/folder_entity.dart';

part 'folders_state.freezed.dart';

@freezed
class FoldersState with _$FoldersState {
  const factory FoldersState.initial() = _Initial;
  const factory FoldersState.getAllFoldersAndNotesSuccess() =
      GetAllFoldersAndNotesSuccess;
  const factory FoldersState.error(String error) = Error;
  const factory FoldersState.selectFolder({
    required FolderEntity folderEntity,
    required int selectedFolderIndex,
  }) = SelectFolder;
}
