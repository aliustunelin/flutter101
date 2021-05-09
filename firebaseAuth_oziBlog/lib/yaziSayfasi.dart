import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class YaziSayfasi extends StatefulWidget {
  @override
  _YaziSayfasiState createState() => _YaziSayfasiState();
}

class _YaziSayfasiState extends State<YaziSayfasi> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  FirebaseAuth kullanici = FirebaseAuth.instance;


  var gelenYaziBasligi = "";
  var gelenYaziIcerigi = "";

  yaziEkle() {
    FirebaseFirestore.instance
        .collection("Yazilar")
        .doc(t1.text)
        .set({ 'kullaniciid': kullanici.currentUser.uid , 'baslik': t1.text, 'icerik': t2.text}).whenComplete(
            () => print("Yazı eklendi"));
  }

  yaziGuncelle() {
    FirebaseFirestore.instance
        .collection("Yazilar")
        .doc(t1.text)
        .update({'baslik': t1.text, 'icerik': t2.text}).whenComplete(
            () => print("Yazı güncellendi"));
  }

  yaziSil() {
    FirebaseFirestore.instance.collection("Yazilar").doc(t1.text).delete();
  }

  yaziGetir() {
    FirebaseFirestore.instance
        .collection("Yazilar")
        .doc(t1.text)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenYaziBasligi = gelenVeri.data()['baslik'];
        gelenYaziIcerigi = gelenVeri.data()['icerik'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yazı Yazma Sayfası"),
      ),
      body: Container(
        margin: EdgeInsets.all(40),
        child: Center(
          child: SingleChildScrollView(
                      child: Column(
              children: [
                TextField(
                  controller: t1,
                ),
                TextField(
                  controller: t2,
                ),
                Column(
                    children: [
                      ElevatedButton(child: Text("Ekle"), onPressed: yaziEkle),
                      ElevatedButton(child: Text("Güncelle"), onPressed: yaziGuncelle),
                      ElevatedButton(child: Text("Sil"), onPressed: yaziSil),
                      ElevatedButton(child: Text("Getir"), onPressed: yaziGetir),
                    ],
                  ),
                ListTile(
                  title: Text(gelenYaziBasligi),
                  subtitle: Text(gelenYaziIcerigi),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}