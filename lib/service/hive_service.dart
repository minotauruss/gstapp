import 'package:gstapp/model/product.dart';
import 'package:gstapp/service/constant.dart';
import 'package:gstapp/service/servis_abstract.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService extends IService {
  @override
  void delete(String id) {
    var box = Hive.box(DbName);
    box.delete(id);
  }


  @override
  Product get(String id) {
  var box = Hive.box(DbName);
  return box.get(id);
 
  }

  @override
  List getAll() {
   List box  = Hive.box(DbName).values.cast().toList();
   return box;
  }

  @override
  void save(Product product) {
      var box = Hive.box(DbName);
      box.put(product.id, product);
  }



}