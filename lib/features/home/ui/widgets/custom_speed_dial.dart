import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/features/notes/folder/add_note/ui/views/add_note_view.dart';

class CustomSpeedDial extends StatelessWidget {
  const CustomSpeedDial({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: AppColors.purple,
        overlayOpacity: 0,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.note_add),
            label: 'Add Note',
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(AddNoteView.routeName);
              // Handle add note action
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.create_new_folder),
            label: 'Add Folder',
            onTap: () {
              // Handle add folder action
            },
          ),
        ]);
  }
}
