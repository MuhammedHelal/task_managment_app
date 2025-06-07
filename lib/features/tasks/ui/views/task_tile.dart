import 'package:flutter/material.dart';
import 'package:planning_app/features/tasks/ui/widgets/task_tile_bottom_container.dart';
import 'package:planning_app/features/tasks/ui/widgets/task_tile_top_container.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaskTileTopContainer(),
        TaskTileBottomContainer(),
      ],
    );
  }
}
