import 'package:hive/hive.dart';

part 'note_entity.g.dart';

@HiveType(typeId: 0)
class NoteEntity {
  @HiveField(0)
  String? title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String date = DateTime.now().toString();

  NoteEntity({this.title, required this.description});
}
