import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'priority.g.dart';

@HiveType(typeId: 6)
enum Priority {
  @HiveField(0)
  high('High'),

  @HiveField(1)
  medium('Medium'),

  @HiveField(2)
  low('Low');

  const Priority(this.name);

  final String name;
}

Color getPriorityColor(Priority priority) {
  switch (priority) {
    case Priority.high:
      return Colors.red;
    case Priority.medium:
      return Colors.orange;
    case Priority.low:
      return Colors.green;
  }
}
