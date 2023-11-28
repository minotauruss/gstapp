import 'package:flutter/material.dart';
import 'package:gstapp/mvvm/home/home.dart';
import 'package:gstapp/service/hive_service.dart';

import '../constant/contant_home.dart';

class MyBottomSheet extends StatefulWidget {
 Function(int,bool,double) saveFunction;

  MyBottomSheet({required this.saveFunction});
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  TextEditingController _controllerName = TextEditingController();
  HiveService _hiveService = HiveService();
  bool swichBotton = false;
  int m = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _controllerName,
                decoration: InputDecoration(
                    fillColor: Colors.white60,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    label: Text(fiyat)),
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Text(temelGida),
                ),
                Container(
                  child: Switch(
                      value: swichBotton,
                      onChanged: (value) {
                        setState(() {
                          swichBotton = !swichBotton;
                        });
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Text(diger),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        m = m + 1;
                      });
                    },
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.white),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  Center(
                    child: Container(
                        height: 80,
                        width: 80,
                        child: Text(
                          m.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (m > 1) {
                          m = m - 1;
                        }
                      });
                    },
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                  widget.saveFunction(m,swichBotton,double.parse(_controllerName.text));
                   Navigator.push(context, MaterialPageRoute(builder:(context)=> Home()));
                  },
                  child: Text(
                    kaydet,
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
