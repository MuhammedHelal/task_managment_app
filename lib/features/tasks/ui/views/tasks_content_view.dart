import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/tasks/logic/cubit/tasks_list_cubit.dart';
import 'package:planning_app/features/tasks/logic/cubit/tasks_list_state.dart';
import 'package:planning_app/features/tasks/ui/widgets/todo_card.dart';

class TasksContentView extends StatefulWidget {
  const TasksContentView({super.key});

  @override
  State<TasksContentView> createState() => _TasksContentViewState();
}

class _TasksContentViewState extends State<TasksContentView>
    with TickerProviderStateMixin {
  late final TasksListCubit tasksCubit;

  late final AnimationController _initialScaleController;
  final _scaleNotifier = ValueNotifier<bool>(false);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tasksCubit = context.read<TasksListCubit>();
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

    return SizedBox(
      width: screenSize.width,
      height: screenSize.height * 0.45,
      child: BlocBuilder<TasksListCubit, TasksListState>(
        builder: (context, state) {
          return PageView.builder(
            onPageChanged: (value) {
              // todoCubit.changeSelectedDate(value);
            },
            physics: const BouncingScrollPhysics(),
            controller: tasksCubit.pageController,
            itemCount: state.tasksDays.length,
            itemBuilder: (context, index) {
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
                child: TodoCard(
                  key: ValueKey(index),
                  todosDayEntity: state.tasksDays[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
