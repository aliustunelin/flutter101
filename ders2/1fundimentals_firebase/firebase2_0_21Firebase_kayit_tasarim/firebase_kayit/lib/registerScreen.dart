
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String? email, password;


//------------ validation için body'i form ile kaplayıp anahtarı ver
  var _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Giriş Ekranı"),
          centerTitle: true,
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
                          setState(() {
                            email = value;
                          });
                        },
                        validator: (value){
                          return value!.contains("@") ? null : "Mail Geçersiz, Lütfen Card Edinin";
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
                          setState(() {
                            password = value;
                          });
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
                            addRegister();
                          }, 
                        child: Text("Kaydol")
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (){
                            ////----------------- goTo loginPage
                          },
                          child: Text("Zaten Hesabım Var...", 
                          style: TextStyle(
                            fontSize: 15.0
                          ),
                          ),
                        ),
                      )
                  ],),
              ),
            ),
          ),),
    );
  }

  void addRegister() {
    if(_formKey.currentState!.validate()){

    }
  }
}