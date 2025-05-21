import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/features/notes/folder/add_note/ui/widgets/add_note_action_buttons.dart';
import 'package:planning_app/features/notes/folder/add_note/ui/widgets/add_note_typing_area.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});
  static const String routeName = '/add-note';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  //  cubit.title = value;
                },
                //  controller: cubit.titleController,
                //   style: MyTextStyles.black20Bold,
                decoration: const InputDecoration(
                  hintText: 'title',
                  //  hintStyle: AppTex.black16,
                  border: InputBorder.none,
                ),
              ),
              const AddNoteTypingArea(),
              const Gap(15),
              const AddNoteActionButtons()
            ],
          ),
        ),
      ),
    );
  }
}
