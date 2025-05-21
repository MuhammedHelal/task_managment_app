import 'package:flutter/material.dart';
import 'package:planning_app/features/create_task/data/models/task_entity.dart';

class TaskProgressCard extends StatelessWidget {
  final List<TaskEntity> tasks;

  const TaskProgressCard({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    double progress =
        tasks.where((todo) => todo.isCompleted).length / tasks.length;
    int completed = tasks.where((todo) => todo.isCompleted).length;
    int total = tasks.length;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Vertical pill progress bar
          Container(
            width: 20,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Text section
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$completed/$total',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'tasks',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
