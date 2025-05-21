// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_day_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksDayEntityAdapter extends TypeAdapter<TasksDayEntity> {
  @override
  final int typeId = 5;

  @override
  TasksDayEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksDayEntity(
      date: fields[0] as String,
      tasks: (fields[1] as List).cast<TaskEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, TasksDayEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.tasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksDayEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
