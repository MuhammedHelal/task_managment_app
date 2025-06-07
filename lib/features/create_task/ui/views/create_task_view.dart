import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/helpers/toast.dart';
import 'package:planning_app/features/create_task/logic/create_task_cubit/create_task_cubit.dart';
import 'package:planning_app/features/create_task/logic/create_task_cubit/create_task_state.dart';
import 'package:planning_app/features/create_task/ui/widgets/calender_widget.dart';
import 'package:planning_app/features/create_task/ui/widgets/month_header.dart';
import 'package:planning_app/features/create_task/ui/widgets/priority_widget.dart';
import 'package:planning_app/features/create_task/ui/widgets/time_selection.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({super.key});
  static const routeName = '/task_form_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Task')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<CreateTaskCubit, CreateTaskState>(
          listener: (context, state) {
            if (state.formStatus == FormStatus.error) {
              showToast(msg: state.errorMessage ?? '', color: Colors.red);
            } else if (state.formStatus == FormStatus.success) {
              Navigator.pop(context);

              showToast(
                msg: 'Task created for ${formatDate(state.selectedDate!)}',
                color: Colors.green,
              );
            }
          },
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MonthHeaderWidget(),
                SizedBox(height: 16),
                CalendarWidget(),
                SizedBox(height: 24),
                SizedBox(height: 16),
                _TaskTitleField(),
                Gap(16),
                _TaskDescriptionField(),
                SizedBox(height: 24),
                TimeSelectionWidget(),
                SizedBox(height: 24),
                PriorityWidget(),
                SizedBox(height: 32),
                _SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TaskTitleField extends StatelessWidget {
  const _TaskTitleField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTaskCubit>();

    return TextFormField(
      controller: cubit.titleController,
      decoration: const InputDecoration(
        labelText: 'Title *',
        hintText: 'Enter task title',
      ),
    );
  }
}

class _TaskDescriptionField extends StatelessWidget {
  const _TaskDescriptionField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTaskCubit>();
    return TextFormField(
      controller: cubit.descriptionController,
      decoration: const InputDecoration(
        labelText: 'Description',
        hintText: 'Enter task description',
      ),
      maxLines: 3,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTaskCubit>();
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => cubit.submitForm(),
        child: const Text('Add Task', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
