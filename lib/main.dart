import 'package:flutter/material.dart';
import 'package:gstapp/model/allProduct.dart';
import 'package:gstapp/model/product.dart';
import 'package:gstapp/mvvm/home/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
 await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(AllProductAdapter());
   await Hive.openBox("product");
   await Hive.openBox("allProduct");

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'GST HESAPLAMA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Home(),
    );
  }
}