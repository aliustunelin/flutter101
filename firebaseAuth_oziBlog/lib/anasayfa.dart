import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Yazıları"),
      ),
      body: KullaniciYazilari(),
    );
  }
}


class KullaniciYazilari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    CollectionReference users = FirebaseFirestore.instance.collection('Yazilar');

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