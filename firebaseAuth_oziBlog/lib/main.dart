
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo1/profilEkrani.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  @override
  _IskeleState createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();



Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () { },
  );

  eror(){
    if (t2.text.length<6) {
        AlertDialog alert = AlertDialog(
    title: Text("Şifre Min 6 Karakterli Olmalıdır."),    
    actions: [
      okButton,
    ],
  );
  }else{
      kayitOl();
  }      
    
  }

  Future<void> kayitOl() async{
    
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: t1.text, password: t2.text).then((kullanici) {
        FirebaseFirestore.instance.collection("Kullanicilar").doc(t1.text).set({
          "KullaniciEposta": t1.text,
          "KullaniciSifre": t2.text
        });
    });
  }

Future<void> girisYap() async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: t1.text, password: t2.text ).then((value) => {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => ProfilEkrani()), (Route<dynamic> route) => false)
  });
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: t1,
              ),
              TextFormField(
                controller: t2,
              ),
              Row(
                children: [
                  ElevatedButton(child: Text("Kaydol") , onPressed: kayitOl),
                  ElevatedButton(child: Text("Giriş Yap") , onPressed: girisYap),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}