import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddNoteActionButtons extends StatelessWidget {
  const AddNoteActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // final AddNoteCubit addNoteCubit = context.read<AddNoteCubit>();
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              //style: MyTextStyles.black16,
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              //   addNoteCubit.addNote();
            },
            child: const Text('Save'
                //  style: MyTextStyles.black16,
                ),
          ),
        ),
      ],
    );
  }
}
