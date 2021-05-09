import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo1/anasayfa.dart';
import 'package:firebase_demo1/main.dart';
import 'package:firebase_demo1/yaziSayfasi.dart';
import 'package:flutter/material.dart';
 class ProfilEkrani extends StatelessWidget {
   const ProfilEkrani({Key key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Profil Ekrani"),
         actions: [
           IconButton(icon: Icon(Icons.home), onPressed: () {
             //tüm yazıların listelendiği sayfafya atar
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AnaSayfa()), (Route<dynamic> route) => true);
           }),
           IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {
             //appbarda çıkış butonu var
              FirebaseAuth.instance.signOut().then((value) => {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Iskele()), (Route<dynamic> route) => false)
           });
           }),
         ],
       ),
       floatingActionButton: FloatingActionButton(onPressed: () {
         //yazıların crud olduğu sayfaya götürür + counter gibi floatingacbuton
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => YaziSayfasi()), (Route<dynamic> route) => true);
       },child: Icon(Icons.add_chart)),
       body: Container(
         color: Colors.cyanAccent,
         child: UserInformation(),
       ),
     );
   }
 }

 
class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //firebase bağlantısı
    FirebaseAuth kullanici= FirebaseAuth.instance; 
    //sorgu ifadesi
    Query users = FirebaseFirestore.instance.collection('Yazilar').where("kullaniciid", isEqualTo: kullanici.currentUser.uid);

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('ters giden birşeyler var!');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("yükleniyor...");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['baslik']),
              subtitle: new Text(document.data()['icerik']),
            );
          }).toList(),
        );
      },
    );
  }
}