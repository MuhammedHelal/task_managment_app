import 'package:hive/hive.dart';
import 'package:planning_app/core/utils/strings.dart';
import 'package:planning_app/features/notes/folder/data/models/note_entity.dart';

class NotesRepo {
  Future<void> addNote({required NoteEntity note}) async {
    final box = Hive.box<NoteEntity>(AppStrings.notesBox);
    await box.add(note);
  }

  Future<List<NoteEntity>> getAllNotes() async {
    final box = Hive.box<NoteEntity>(AppStrings.notesBox);
    return box.values.toList();
  }
}
