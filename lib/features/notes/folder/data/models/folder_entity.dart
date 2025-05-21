import 'package:hive/hive.dart';
import 'package:planning_app/features/notes/folder/data/models/note_entity.dart';

part 'folder_entity.g.dart';

@HiveType(typeId: 1)
class FolderEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  List<NoteEntity>? notes;

  FolderEntity({
    required this.name,
    this.notes,
  });
}
