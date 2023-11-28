import 'package:gstapp/model/product.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'allProduct.g.dart';
/* flutter pub run build_runner build --delete-conflicting-outputs */

@HiveType(typeId: 1)
class AllProduct extends HiveObject{
  @HiveField(0)
  String id;

  @HiveField(1)
  String date;

  @HiveField(2)
  List<Product> allProductList;

  AllProduct({
    required this.allProductList,
    required this.date,
    required this.id
  });



}