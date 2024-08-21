// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

import  'package:hive/hive.dart';

import 'package:subspace_blogs/models/Blog.dart';

class BlogAdapter extends TypeAdapter<Blog> {
  @override
  final int typeId = 0;

  @override
  Blog read(BinaryReader reader) {
    return Blog(
      id: reader.readString(),
      title: reader.readString(),
      imageUrl: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Blog obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BlogAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
