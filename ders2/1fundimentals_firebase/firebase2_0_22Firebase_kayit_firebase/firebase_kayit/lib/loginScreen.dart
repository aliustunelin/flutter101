import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_kayit/girisEkrani.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email, password;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giriş Ekranı"),
      ),
      body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                      TextFormField(
                        onChanged: (value){
                         email = value;
                        },
                        validator: (value){
                          return value!.contains("@") ? null : "Mail Geçersiz, Lütfen Kontrol Edin";
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(                    
                          labelText: "Email Giriniz",
                          hintText: "NetWork Card Email'inizi Giriniz",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 6.0,),
                      TextFormField(
                        onChanged: (value){
                         password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Şifre Giriniz",
                          hintText: "NetWork Card Şifrenizi Giriniz",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value){
                          return value!.length >= 6 ? null : "Min 6 Karakter Girin";
                        },
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          onPressed: (){
                           loginFunc();
                          }, 
                        child: Text("Giriş Yap")
                        ),
                      ),                 
                  ],),
              ),
            ),
          ),),
    );
  }

  void loginFunc() {
    if(_formKey.currentState!.validate()){
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((user) {
          // --------------- sing in success go to home page
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> GirisEkrani()),
            (Route<dynamic> route) => false);
      } ).catchError((hata){
              Fluttertoast.showToast(msg: hata);
        }); 
    }
  
  }
}