import 'package:flutter/material.dart';
import 'package:planning_app/core/utils/text_styles.dart';

class FolderLength extends StatelessWidget {
  const FolderLength({super.key, required this.active, required this.length});
  final bool active;
  final int length;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: 12,
      backgroundColor: active ? Colors.white : Colors.grey,
      child: Text(
        length.toString(),
        style: FolderTextStyles.folderLength,
      ),
    );
  }
}
