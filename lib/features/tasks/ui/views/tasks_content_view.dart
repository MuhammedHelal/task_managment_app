import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/create_task/data/models/tasks_day_entity.dart';
import 'package:planning_app/features/tasks/logic/cubits/cubit/tasks_cubit.dart';
import 'package:planning_app/features/tasks/ui/widgets/task_card.dart';

class TasksListViewBody extends StatefulWidget {
  const TasksListViewBody({super.key});

  @override
  State<TasksListViewBody> createState() => _TasksListViewBodyState();
}

class _TasksListViewBodyState extends State<TasksListViewBody>
    with TickerProviderStateMixin {
  late final TasksCubit tasksCubit;

  late final AnimationController _initialScaleController;
  final _scaleNotifier = ValueNotifier<bool>(false);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tasksCubit = context.read<TasksCubit>();
    _initialScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleNotifier.value = true;
        }
      });
    Future.delayed(
      const Duration(seconds: 2),
      _initialScaleController.forward,
    );
  }

  @override
  void dispose() {
    _initialScaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    print('TasksListViewBody.build: screenSize $screenSize');

    return SizedBox(
      width: screenSize.width,
      height: screenSize.height * 0.45,
      child: BlocSelector<TasksCubit, TasksState, List<TasksDayEntity>>(
        selector: (state) {
          return state.tasksDays;
        },
        builder: (context, state) {
          print('TasksListViewBody.build: state.length ${state.length}');

          return PageView.builder(
            onPageChanged: tasksCubit.onPageChanged,
            physics: const BouncingScrollPhysics(),
            controller: tasksCubit.pageController,
            itemCount: state.length,
            itemBuilder: (context, index) {
              print('TasksListViewBody.itemBuilder: index $index');
              final taskDay = state[index]; // in PageView.builder

              return AnimatedBuilder(
                animation: Listenable.merge([
                  tasksCubit.pageController,
                  _initialScaleController,
                ]),
                builder: (context, child) {
                  double pageOffset = 0;
                  if (tasksCubit.pageController.position.hasContentDimensions) {
                    pageOffset = tasksCubit.pageController.page! - index;
                  }

                  // Calculate target scale based on page position
                  double targetScale =
                      1 - (pageOffset.abs() * 0.2).clamp(0.0, 0.5);

                  // Interpolate between initial scale (1.0) and target scale
                  double currentScale =
                      1.0 - (1.0 - targetScale) * _initialScaleController.value;

                  return Transform.scale(
                    scale: currentScale,
                    child: child,
                  );
                },
                child: TaskCard(tasksDayEntity: taskDay),
              );
            },
          );
        },
      ),
    );
  }
}
