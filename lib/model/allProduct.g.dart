// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allProduct.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllProductAdapter extends TypeAdapter<AllProduct> {
  @override
  final int typeId = 1;

  @override
  AllProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllProduct(
      allProductList: (fields[2] as List).cast<Product>(),
      date: fields[1] as String,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AllProduct obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.allProductList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
