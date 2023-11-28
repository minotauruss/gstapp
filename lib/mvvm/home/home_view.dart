


import 'package:flutter/material.dart';
import 'package:gstapp/model/product.dart';
import 'package:gstapp/mvvm/home/constant/constant_style.dart';
import 'package:gstapp/mvvm/home/constant/contant_home.dart';
import 'package:gstapp/mvvm/home/home.dart';
import 'package:gstapp/mvvm/home/home_view_model.dart';
import 'package:gstapp/mvvm/home/widget/floating_home.dart';
import 'package:gstapp/mvvm/home/widget/myBottom_sheet.dart';

class HomeView extends HomeViewModel {
    List<Product> listProduct=[];
    double toplamMiktar = 0.0;
    List<String> toplamFiyatAndCount = [];

    @override
  void initState() {
    // TODO: implement initState
    super.initState();

      setState(() {
 
        listProduct = getAllProducts();
    
      toplamMiktar = toplamFiyatHesapla();
      toplamFiyatAndCount = toplamProuctCountAndFiyat();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarText),
      automaticallyImplyLeading: false,
      actions: [IconButton(onPressed: (){
        deleteAll();
    Navigator.push(context, MaterialPageRoute(builder:(context)=> Home()));




      }, icon: Icon(Icons.refresh))],),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      title,
                      style: ConstantStyle.textStyleTitle,
                    ),
                  ),
                  Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      subTitle,
                      style: ConstantStyle.textStyleSubTitle,
                    ),
                  ),
                  Container(
                    child: Text( timeHesapla()),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.amber
                          ),
                       
                          child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  total,
                                  style: ConstantStyle.textStyleTitle,
                                ),
                              ),
                              Container(
                                child: Text(
                                  toplamMiktar.toString().length>6? toplamMiktar.toString().substring(0,6):toplamMiktar.toString() +" AUD",
                                  style: ConstantStyle.textStyleMiktar,
                                ),
                              ),
                              
                           
                            ],
                           
                          ),
                        ),
                         Container(
                           width: 150,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: toplamGstHesapla()>18.18? Colors.green : Colors.red
                            ),
                           child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Container(
                                    
                           
                              child: Text(
                                gst,
                                style: ConstantStyle.textStyleTitle,
                              ),
                            ),
                            Container(
                              
                              child: Text(
                                toplamGstHesapla().toString().length>5?  toplamGstHesapla().toString().substring(0,5): toplamGstHesapla().toString() + " AUD",
                                style: ConstantStyle.textStyleMiktar ,
                              ),
                            ),
                                               ],),
                         )
                      ],
                    ),
                  ),
                 statistic(toplamFiyatAndCount[1],toplamFiyatAndCount[2],toplamFiyatAndCount[0],temelGida),
                   statistic(toplamFiyatAndCount[4],toplamFiyatAndCount[5],toplamFiyatAndCount[3],diger),


            
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    height:listProduct.length *100,
                    child: ListView.builder(
                        itemCount: listProduct.length,
                        itemBuilder: (context, index) {
                          Product data = listProduct[index];
                          gstHesapla(data.price,data.category,data.quantity);
                          return Column(
                            children: [
                              ListTile(
                                title: Text("${data.category==false ? temelGida : diger } X ${data.quantity}   Toplam Ürün Fiyatı :  ${data.price*data.quantity} AUD"),
                                subtitle: Text("Ürün GST Miktarı : ${gstHesapla(data.price,data.category,data.quantity).toString().substring(0,5)} AUD "),
                              ),
                              Divider()
                            ],
                          );
                        }),
                  ),
              
                ]
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatinButtonHome(save: getSheet),
    );
  }

  void getSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) => MyBottomSheet(saveFunction: (p0, p1, p2) {
          save(p1, p2, p0);
          
        },));
  }

  Widget statistic (String fiyat , String gst , String count, String baslik)
{
return       Container(
                    child: Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text("Toplam ${baslik}    ${fiyat.length>6?fiyat.substring(0,6):fiyat} " ),
                            subtitle: Text("Gst ${baslik}    ${gst.length>5?gst.substring(0,5):gst} " ),
                            trailing: Text("${urun} ${count}"),
                          ),
                        )
                      ],
                    ),
                  );}}
