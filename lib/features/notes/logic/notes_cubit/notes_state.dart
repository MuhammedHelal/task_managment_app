import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planning_app/features/notes/folder/data/models/note_entity.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.initial() = _Initial;
  const factory NotesState.success(List<NoteEntity> notes) = Success;
  const factory NotesState.error(String message) = Error;

  const factory NotesState.addNotesuccess() = AddNoteSuccess;
  const factory NotesState.addNoteError(String message) = AddNoteError;

  const factory NotesState.updateNotesuccess() = UpdateNoteSuccess;
  const factory NotesState.updateNoteError(String message) = UpdateNoteError;

  const factory NotesState.deleteNotesuccess() = DeleteNoteSuccess;
  const factory NotesState.deleteNoteError(String message) = DeleteNoteError;
}
