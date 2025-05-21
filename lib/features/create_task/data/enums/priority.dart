import 'package:hive/hive.dart';

part 'priority.g.dart';

@HiveType(typeId: 6) // Choose a unique typeId (0-223)

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
