//önceden hep bir teteikleyiciyle get ile çektik, şimdi stream ile dbnin bir coll veya docuna abone olcaz ve değişiklikleri hemen yakalacaz
// babaRef veya CollRef içinde snapshots() methodunu çağırırsak, stream dönen bir querySnapsaht dönüyor,

// 10-) uygulamada butona tıklıyorduk, butonun altına bir alana streamBuilder ekleyelim



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class OkumaSayfasi3 extends StatefulWidget {
  OkumaSayfasi3({Key? key}) : super(key: key);

  @override
  _OkumaSayfasi3State createState() => _OkumaSayfasi3State();
}

class _OkumaSayfasi3State extends State<OkumaSayfasi3> {
  
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
                var response = await moviesRef.get();
                var liste = response.docs;

                gelenYazi = liste[0].data().toString();
                print("okuma oldu!");

                setState(() {

                  gelenYazi = liste.last.data().toString();
                });
                                        
              },
              ),
              Divider(
                height: 11.0,
              ),
              Text("Ara Katman:"),
              
              // 10- streambuilder eklendi, şimdi docRef (babaRef) dinleyecem o yüzden Streamin generici <DocumentSnapshots> 
              // strem:nei dinleyim? ve builder:ne çizeyim? required
              StreamBuilder<DocumentSnapshot>(
                // asyncSnapshot docSnapshot gibin birşey, iç içe geçmiş 2 tane snapshot var 8.png'de anlatılıyoor
                builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
                    return Text("${asyncSnapshot.data.data().toString()}");
                },
                stream: babaRef.snapshots(),
                )
            ],
          ),
        ),
      ),
    );
  }
}