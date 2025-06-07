import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/functions/time_fns.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/core/utils/text_styles.dart';
import 'package:planning_app/features/tasks/logic/cubits/task_day_view_cubit/task_day_view_cubit.dart';
import 'package:planning_app/features/tasks/ui/widgets/task_progress_card.dart';

import '../widgets/todos_day_view_body.dart';

class TaskDayView extends StatelessWidget {
  const TaskDayView({super.key});
  static const routeName = '/task-day-view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          TodosDayViewBody(),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TasksDayViewCubit>(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.taskColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Text(
                  style: AppTextStyles.white20Bold,
                  formatDate(cubit.state.tasksDayEntity.date),
                ), // todosDayEntity.dateTime,
              ],
            ),
            const Gap(20),
            const TaskProgressCard(),
          ],
        ),
      ),
    );
  }
}
