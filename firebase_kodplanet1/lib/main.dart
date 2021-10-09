// firebase console üzerindeki kurulumlar, pub dev ekelemeler ve main üzerinde init app ypılır

// 1 firebase'de testColl adında bir coll oluşturdum, autoID int(sayi)=99    db mimari => testColl _> autoId _> sayi:99
//    collection bir klasör, içinde bir döküman var dökümanın içinde field bilgi bu field içinde olur
//      test etmek adına floatingactionbutton içinde counter attıralım dbye yazalım
//        1.2  test için gerekenler flotbutton onpressde yazar



//          önemli laf kalabalıgı:  Flutter: Firebase Firestore #1. Firestore Veri Yapısı #
//            her collection bir db'dir
//                Firebase 2 tane dbsi var realtime ve firestore
//                    realtime: 1 tane json içinde
//                    firetore: coll ve doclu bir yapıda tutarsın okumak vs daha kolay olur
//                    firestoreAnlatici1.png  iile firestore geenl yapısı görseli
//                    firestoreAnlatici3.png  kitaplarım doclar ve bunlarında alt colları -ödünç alanları blgileri- olabilir 4ncü resme geldik
//                  firestore nedir: https://www.youtube.com/watch?v=v_hR4K4auoQ


// ÖRNEK DB MİMARİSİ
//      /movies
//          ->(doc) esaretin bedeli 
//            ->(field) name : esaretin bedeli
//            ->(field) year : 1994
//            ->(field) rating : 9.4
//          ->(doc) baba
//            ->(field) name : baba
//            ->(field) year : 1972
//            ->(field) rating : 9.0
//            ->(coll) avards
//              ->(doc) autoID
//                ->(field) name : Oscar'74
//          ->(doc) Kara Şövalye
//            ->(field) name : Kara Şövalye
//            ->(field) year : 2008
//            ->(field) rating : 9.0

//      2-) artık db'ye okuma için erişelim
//          okumayı anlamak için referansları anlamak lazım
//      okuma yapmak için herbir verinin yoluna -referansına- ihtiyacımız var
//        coll: collectionReference, doc: documentReference ile ulaşılıyor
//          okumaları okuma_sayfasi.dart yapıyorum devamıonın yolları oradan




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_kodplanet1/okuma_sayfasi1_docSnap.dart';
import 'package:firebase_kodplanet1/okuma_sayfasi2_collSnap.dart';
import 'package:firebase_kodplanet1/okuma_sayfasi3_streamBuilder_docDinleme.dart';
import 'package:firebase_kodplanet1/okuma_sayfasi4_streamBuilder_collDinleme.dart';
import 'package:flutter/material.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(MyApp());
   }

class MyApp extends StatelessWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context) {        
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        //  ilk başta OkumaSayfasi() sonrasında diğer dersler geliyor
        body: OkumaSayfasi4(),
        floatingActionButton: ElevatedButton(child: Text("Firebase Arttır"), onPressed: (){
          _firebaseArttirYaz();
        },),
      ),
    );
  }

  void _firebaseArttirYaz() {

          //1.2 firebase ilk test
          //burada firebase coll'a veriyi yazcaz

          // önce bir instance oluştuuruyorum, bu beni firebase dbye bağlayacak obje
          FirebaseFirestore firebase = FirebaseFirestore.instance;

          //şimdide db içindeki testColl yolunu tutacak ve bu yola yazma okuma vs yapacak bir yapı lzm
          CollectionReference testCollRef = firebase.collection("testColl");

          //simdi bu testColl referansı ile crud yapabilirm
          testCollRef.add({
            'sayi' : '$counter'
          });

            counter++;

  }
}