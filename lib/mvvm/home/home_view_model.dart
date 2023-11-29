import 'package:flutter/material.dart';
import 'package:gstapp/constant/time_schedulate.dart';
import 'package:gstapp/model/product.dart';
import 'package:gstapp/mvvm/home/home.dart';
import 'package:gstapp/service/hive_service.dart';
import 'package:uuid/uuid.dart';

abstract class HomeViewModel extends State<Home> {
  final HiveService _hiveService = HiveService();
 
  Uuid uuid = const Uuid();
  final TimeFormatNow _timeFormatNow = TimeFormatNow();
  final DateTime now = DateTime.now();

  List<Product> getAllProducts() {
  
     List getAll = _hiveService.getAll();

    List<Product> allProduct = getAll
        .map((e) => Product(
            id: e.id,
            date: e.date,
            category: e.category,
            price: e.price,
            quantity: e.quantity))
        .toList();

    return allProduct;
   
  }



  void save(bool category, double price, int quantity) {
    
    Product product = Product(
        id: uuid.v1(),
        date: _timeFormatNow.dateFormatGAY(now),
        category: category,
        price: price,
        quantity: quantity);
    _hiveService.save(product);
  }

  void delete(String id) {
    _hiveService.delete(id);
  }

  void deleteAll(){
    List <Product> listproduct = getAllProducts();
    if(listproduct.isNotEmpty){
      for(var item in listproduct){
        delete(item.id);
      }
    }
  }



  Product getProduct(String id) {
    var product = _hiveService.get(id);
    Product newProduct = Product(
        id: product.id,
        date: product.date,
        category: product.category,
        price: product.price,
        quantity: product.quantity);
    return newProduct;
  }



  double gstHesapla(double price, bool category, int quantity) {
    if (category == false) {
      return( price - ((price * 50) / 51))*quantity;
    } else {
      return (price - ((price * 10) / 11))*quantity;
    }
  }

  double toplamFiyatHesapla() {
    double toplamFiyat = 0;
    List<Product> productAll = getAllProducts();

  
      for (var item in productAll) {
      toplamFiyat = toplamFiyat + (item.price*item.quantity);
    }
  

    return toplamFiyat;
  }

  double toplamGstHesapla() {
    double toplamGst = 0;
    List<Product> productAll = getAllProducts();

    for (var item in productAll) {
      toplamGst = toplamGst + gstHesapla(item.price, item.category,item.quantity);
    }
    return toplamGst;
  }

  String timeHesapla() {
    final DateTime now = DateTime.now();
    return _timeFormatNow.dateFormatGAY(now);
  }

 List <String> toplamProuctCountAndFiyat() {
    int temelGidaCount = 0;
    int digerCount = 0;

    double toplamTemelGidaGst=0;
    double toplamDigerGst=0;
    
    double temelGidaToplamFiyat = 0;
    double digerToplamFiyat = 0;

    List<Product> productAll = getAllProducts();
    
    for (var item in productAll) {

      if (item.category == false) {
        temelGidaCount = temelGidaCount + 1;
        temelGidaToplamFiyat = temelGidaToplamFiyat + (item.price*item.quantity);
        toplamTemelGidaGst = toplamTemelGidaGst + gstHesapla(item.price, item.category,item.quantity);
        
      }else{
        digerCount = digerCount +1;
        digerToplamFiyat = digerToplamFiyat +(item.price*item.quantity);
        toplamDigerGst = toplamDigerGst + gstHesapla(item.price, item.category,item.quantity);

      }
    }
    return [temelGidaCount.toString(),
    temelGidaToplamFiyat.toString(),
    toplamTemelGidaGst.toString(), 
    digerCount.toString(),
    digerToplamFiyat.toString(),
     toplamDigerGst.toString(),];
  }



    
}
