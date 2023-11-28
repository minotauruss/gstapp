

import 'package:hive/hive.dart';

part 'product.g.dart';
/* flutter pub run build_runner build --delete-conflicting-outputs */

@HiveType(typeId: 0)
class Product extends HiveObject{

  @HiveField(0)
  String id;

  @HiveField(1)
  String date;

  @HiveField(2)
  bool category;

   @HiveField(3)
  double price;

    @HiveField(4)
  int quantity;


  Product({
      required this.id,
    required this.date,
    required this.category,
    required this.price,
    required this.quantity
    
  });



}