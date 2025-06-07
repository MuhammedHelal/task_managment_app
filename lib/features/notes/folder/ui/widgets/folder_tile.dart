import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/core/utils/text_styles.dart';
import 'package:planning_app/features/notes/folder/data/models/folder_entity.dart';
import 'package:planning_app/features/notes/folder/ui/widgets/folder_length.dart';

class FolderTile extends StatelessWidget {
  const FolderTile({
    super.key,
    required this.folderEntity,
    required this.isActive,
  });
  final bool isActive;
  final FolderEntity folderEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? AppColors.black : AppColors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                folderEntity.name,
                style: isActive
                    ? FolderTextStyles.active
                    : FolderTextStyles.notActive,
              ),
              const Gap(10),
              FolderLength(
                active: isActive,
                length: folderEntity.notes?.length ?? 0,
              ),
            ],
          ),
        ),
        const Gap(10),
      ],
    );
  }
}
