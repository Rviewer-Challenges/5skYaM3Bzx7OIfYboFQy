// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedItemAdapter extends TypeAdapter<FeedItem> {
  @override
  final int typeId = 0;

  @override
  FeedItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedItem()
      ..id = fields[0] as String
      ..title = fields[1] as String
      ..link = fields[2] as String
      ..date = fields[3] as String?
      ..description = fields[4] as String
      ..author = fields[5] as String
      ..publisher = fields[6] as String?
      ..thumbnailUrl = fields[7] as String?
      ..source = fields[8] as String
      ..isFav = fields[9] as bool;
  }

  @override
  void write(BinaryWriter writer, FeedItem obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.author)
      ..writeByte(6)
      ..write(obj.publisher)
      ..writeByte(7)
      ..write(obj.thumbnailUrl)
      ..writeByte(8)
      ..write(obj.source)
      ..writeByte(9)
      ..write(obj.isFav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
