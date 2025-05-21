import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/features/create_task/data/models/task_entity.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/logic/cubit/tasks_list_cubit.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_check_circle.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todosDayEntity,
    required this.index,
  });

  final TasksDayEntity todosDayEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TasksListCubit todoCubit = context.read<TasksListCubit>();
    final TaskEntity todo = todosDayEntity.tasks[index];

    return Row(
      children: [
        StatefulBuilder(builder: (context, setState) {
          bool isCompleted = todo.isCompleted;

          return GestureDetector(
            onTap: () {
              setState(() {
                isCompleted = !isCompleted;
              });
              // todoCubit.toggleIsCompleted(
              //   todoIndex: index,
              //   currentSelectedDate: todosDayEntity.date,
              // );
            },
            child: TodoCheckCircle(
              isCompleted: isCompleted,
            ),
          );
        }),
        const Gap(10),
        Text(todo.title),
      ],
    );
  }
}
