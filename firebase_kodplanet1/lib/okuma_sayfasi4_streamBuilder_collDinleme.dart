// öncekinde streambuilder ile doc dinledim
//  şimdi coll dinleyelim
// 11-) artık querySnapshot dinlayeceğim
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class OkumaSayfasi4 extends StatefulWidget {
  OkumaSayfasi4({Key? key}) : super(key: key);

  @override
  _OkumaSayfasi4State createState() => _OkumaSayfasi4State();
}

class _OkumaSayfasi4State extends State<OkumaSayfasi4> {
  
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
            /// 11-> coll içindeki tüm docları çekeceğimden QuerySnapshot dinleyecem
              StreamBuilder<QuerySnapshot>(
                stream: moviesRef.snapshots(),
                builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
                  // doclar artık listeyle gelecek
                    List<DocumentSnapshot> liste = asyncSnapshot.data.doc;
                    late var yazi = "";

                    // listview.builder tüm alanı kaplamaya çalışacaktır, bu yüzden en azonda flexible widget içine almak iidir
                    //birden falza bilgi gelecek listwiev dönelim, listview.builder builderı içine aldığı şeyi o kadar çizer :=)                    
                    //        listview içine card->listtile yeterli ve güzel bir hareket
                    return Flexible(
                      child: ListView.builder(
                        itemCount: liste.length,
                        itemBuilder: (BuildContext context, int index) {
                          yazi = liste[index].data()['name'].toString();
                            return Text('$yazi');
                        },
                      ),
                    );                    
                },                
                )
            ],
          ),
        ),
      ),
    );
  }
}