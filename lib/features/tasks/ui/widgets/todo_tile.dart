import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/features/create_task/data/models/task_entity.dart';
import 'package:planning_app/features/tasks/logic/cubits/cubit/tasks_cubit.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_check_circle.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.taskEntity,
  });

  final TaskEntity taskEntity;

  @override
  Widget build(BuildContext context) {
    final TasksCubit cubit = BlocProvider.of<TasksCubit>(context);
    return Row(
      children: [
        StatefulBuilder(builder: (context, setState) {
          bool isCompleted = taskEntity.isCompleted;

          return GestureDetector(
            onTap: () {
              cubit.toggleTaskCompletion(taskEntity: taskEntity);
              setState(() {
                isCompleted = !isCompleted;
              });
            },
            child: TodoCheckCircle(isCompleted: isCompleted),
          );
        }),
        const Gap(10),
        Text(taskEntity.title),
      ],
    );
  }
}
