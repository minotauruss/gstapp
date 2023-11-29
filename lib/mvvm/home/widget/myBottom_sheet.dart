import 'package:flutter/material.dart';
import '../constant/contant_home.dart';


// ignore: must_be_immutable
class MyBottomSheet extends StatefulWidget {
 Function(int,bool,double) saveFunction;

  MyBottomSheet({super.key, required this.saveFunction});
  @override
  // ignore: library_private_types_in_public_api
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  final TextEditingController _controllerName = TextEditingController();
  bool swichBotton = false;
  int m = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
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
                    label: const Text(fiyat)),
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: const Text(temelGida),
                ),
                Switch(
                    value: swichBotton,
                    onChanged: (value) {
                      setState(() {
                        swichBotton = !swichBotton;
                      });
                    }),
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: const Text(diger),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(12.0),
              child: Text( gstMuaf, textAlign: TextAlign.center,style: TextStyle(color: swichBotton==false? Colors.black:Colors.white.withOpacity(0)),),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                          if (m > 1) {
                          m = m - 1;
                        }
                      });
                    },
                      style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    ),
                  
                  ),
                  Center(
                    child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Text(
                          m.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                      
                          m = m + 1;
                        
                      });
                    },
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text(
                      "+",
                      style: TextStyle(color: Colors.white),
                    ),
                
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                  widget.saveFunction(m,swichBotton,double.parse(_controllerName.text));
                   //Navigator.push(context, MaterialPageRoute(builder:(context)=> Home()));
                  }, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    kaydet,
                    style: TextStyle(color: Colors.white),
                  ),
                 
                ))
          ],
        ),
      ),
    );
  }
}
