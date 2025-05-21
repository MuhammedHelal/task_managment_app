import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/notes/folder/data/models/note_entity.dart';
import 'package:planning_app/features/notes/logic/notes_cubit/notes_state.dart';
import 'package:planning_app/features/notes/logic/repos/add_note_repo.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.notesRepo) : super(const NotesState.initial());
  final NotesRepo notesRepo;
  List<NoteEntity> dummyNotes = [
    NoteEntity(title: 'Note 1', description: 'Description 1'),
    NoteEntity(title: 'Note 2', description: 'Description 2'),
    NoteEntity(
      title: 'Note 2',
      description: 'Description 2 DescriptionDescription\nDescription',
    ),
    NoteEntity(
      title: 'Note 2',
      description: 'Description 2 DescriptionDescription',
    ),
  ];

  void addNote({required NoteEntity note}) async {
    try {
      await notesRepo.addNote(note: note);
      dummyNotes.add(note);
      emit(const NotesState.addNotesuccess());
    } catch (e) {
      emit(NotesState.addNoteError(e.toString()));
    }
  }

  void getAllNotes() async {
    try {
      final allNotes = await notesRepo.getAllNotes();
      if (allNotes.isEmpty) {
        emit(NotesState.success(dummyNotes));
      } else {
        emit(NotesState.success(allNotes));
      }
    } catch (e) {
      emit(NotesState.error(e.toString()));
    }
  }

  void showFolderNotes({required List<NoteEntity> folderNotes}) {
    emit(NotesState.success(folderNotes));
  }
}
