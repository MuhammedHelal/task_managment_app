import 'package:flutter/material.dart';
import 'package:planning_app/core/utils/colors.dart';

class TodoCheckCircle extends StatelessWidget {
  const TodoCheckCircle({
    super.key,
    required this.isCompleted,
  });
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isCompleted ? AppColors.todoColor : Colors.white,
        border: Border.all(
          width: 1,
          color: AppColors.black,
        ),
      ),
      child:
          isCompleted ? const Icon(Icons.check, color: AppColors.black) : null,
    );
  }
}
