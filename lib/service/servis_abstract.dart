import 'package:gstapp/model/product.dart';

abstract class IService {
  void save (Product product);
  void delete(String id);
  Product get(String id);
  List getAll();

}