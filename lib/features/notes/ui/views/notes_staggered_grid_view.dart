import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:planning_app/features/notes/folder/data/models/note_entity.dart';
import 'package:planning_app/features/notes/ui/widgets/note_tile.dart';

class NotesStaggeredGridView extends StatelessWidget {
  const NotesStaggeredGridView({super.key, required this.notes});
  final List<NoteEntity> notes;
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NoteTile(note: notes[index]);
      },
    );
  }
}
