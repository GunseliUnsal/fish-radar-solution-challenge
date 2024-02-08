// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteFishAdapter extends TypeAdapter<FavoriteFish> {
  @override
  final int typeId = 0;

  @override
  FavoriteFish read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteFish(
      id: fields[0] as int,
      name: fields[1] as String,
      img: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteFish obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteFishAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
