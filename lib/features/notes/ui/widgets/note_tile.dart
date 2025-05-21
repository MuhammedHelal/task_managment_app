import 'package:flutter/material.dart';
import 'package:planning_app/features/notes/folder/data/models/note_entity.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.note});
  final NoteEntity note;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.title ?? ''),
          Text(note.description),
        ],
      ),
    );
  }
}
