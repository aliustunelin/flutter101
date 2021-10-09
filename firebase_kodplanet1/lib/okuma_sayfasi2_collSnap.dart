//  okumayı doc üzerinen yaptık
//  şimdide coll üzerinden get() yapalım noluo

//  4-) burada querySnapshot dönecek
//   7.png içinde query ve doc snaplerini anlatıyor


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class OkumaSayfasi2 extends StatefulWidget {
  OkumaSayfasi2({Key? key}) : super(key: key);

  @override
  _OkumaSayfasi2State createState() => _OkumaSayfasi2State();
}

class _OkumaSayfasi2State extends State<OkumaSayfasi2> {
  
  final _firestore = FirebaseFirestore.instance;
  late String gelenYazi = ";";
  @override
  Widget build(BuildContext context) {  
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
              onPressed: ()async{
                // 4-->  collection get yapınca querySnapshot döndü
                var response = await moviesRef.get();
                //docSnapshot içinde response bize kendince map dönerdi onu data ile açardık
                // collSnapshot içinde docSnapshotlar olan bir liste döner
                var liste = response.docs;

                // ulan maden yine docSnap listesi dönecekti neden querySnapshot var?
                // bunun döndüğü list içinde ne var?
                // 6.png'de bunu nlatıyor,
                // coll geti querySnapshot isminde içnde docSnaplerin olduğu bir liste döner ve biz liste[0].. vs ile bu docSnaplere erişiğ .data ile içlerine gireriz
                gelenYazi = liste[0].data().toString();
                print("okuma oldu!");

                setState(() {
                  // okurken first, last gibi keyworlerde var 
                  gelenYazi = liste.last.data().toString();
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