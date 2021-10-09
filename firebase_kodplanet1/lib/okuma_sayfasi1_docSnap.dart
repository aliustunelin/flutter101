//   2-) firebase erişmek için referans oluşturcam

//    bir doc veya coll refi get() ile okuduğumda col: querySnapshot, doc:documentSnapshot döner
//  3-) artık okuma, okuma asenkron yapılır ve bir tetikleme -butonnvs- olur

//aşadaki anlatıcı incele, en sonda 5.pngde anlatıyor yapıyı sonrasında 4-) için okuma sayfası2_collSnap.darttan devam


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class OkumaSayfasi extends StatefulWidget {
  OkumaSayfasi({Key? key}) : super(key: key);

  @override
  _OkumaSayfasiState createState() => _OkumaSayfasiState();
}

class _OkumaSayfasiState extends State<OkumaSayfasi> {
  //referanslarım için obje
  final _firestore = FirebaseFirestore.instance;
  late String gelenYazi = ";";
  @override
  Widget build(BuildContext context) {
    //coll ref oluturudum
    CollectionReference moviesRef = _firestore.collection("movies");
    
    DocumentReference babaRef = moviesRef.doc("baba");

    return Scaffold(
      appBar: AppBar(title: Text("Firebase Okuma"),),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${gelenYazi}"),
              ElevatedButton(child: Text("Oku"),
              // 3-->  okumayı buna tetikletcez, async olcak. Hangi satırı bekleteceksem önüne await koycam
              onPressed: ()async{
                //doc refi getle alırsak, documentSnapshot dönüyordu
                var response = await babaRef.get();
                // docSnapshot ?? firebasein içindeki json-map tipini bana yollarken yolda kullnadığı -protokol- bir veri tipi
                //    documentSnapshot içinden veriyi çıkartmamız lazım, docSnap'in data methodu içindekini map olarak bize döner
                //      bu olaylar  firestoreAnlatici5.png'de anlatılır

                var veri = response.data();
                
                setState(() {
                  gelenYazi = veri.toString();
                });
                                        
              },
              )
            ],
          ),
        ),
      ),
    );
  }
}