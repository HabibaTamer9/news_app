// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardsModelAdapter extends TypeAdapter<CardsModel> {
  @override
  final int typeId = 0;

  @override
  CardsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardsModel(
      title: fields[0] as String,
      description: fields[1] as String?,
      url: fields[2] as String,
      content: fields[3] as String,
      image: fields[4] as String,
      authorName: fields[5] as String,
      date: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.authorName)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
