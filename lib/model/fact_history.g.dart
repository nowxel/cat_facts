// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactHistoryAdapter extends TypeAdapter<FactHistory> {
  @override
  final int typeId = 1;

  @override
  FactHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactHistory(
      fields[0] as String,
      fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FactHistory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fact)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
