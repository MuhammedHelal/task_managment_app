// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FolderEntityAdapter extends TypeAdapter<FolderEntity> {
  @override
  final int typeId = 1;

  @override
  FolderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FolderEntity(
      name: fields[0] as String,
      notes: (fields[1] as List?)?.cast<NoteEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, FolderEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FolderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
