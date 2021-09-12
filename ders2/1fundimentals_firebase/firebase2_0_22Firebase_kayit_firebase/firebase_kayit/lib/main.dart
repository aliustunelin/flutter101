import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_kayit/registerScreen.dart';
import 'package:flutter/material.dart';

// 1) tasarım yapıldı: textformfield'lar ve onların valide'leri yapıldı
// 2) firebase bağlantı işlemleri: authenticate'den email kısmını enable yaptık
// 3) firebase_auth firebase_core pubspec eklendi
// 4) firebase'i androide bağlaamları yaptık, ios bağlama : sanal akademi m&n Flutter 2.0 ile Firebase'de Kullanıcı Kayıt ve Giriş İşlemleri Ders 8: Projeyi Firebase'e Bağlama
// 5) 



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegisterApp(),    
  ));
}
class RegisterApp extends StatelessWidget {
  const RegisterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterScreen();
  }
}