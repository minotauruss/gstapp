import 'package:flutter/material.dart';
import 'package:gstapp/mvvm/home/constant/contant_home.dart';

// ignore: must_be_immutable
class FloatinButtonHome extends StatelessWidget {
 VoidCallback save;
FloatinButtonHome({required this.save, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: save, child: const Icon(Icons.add),);
  }
}