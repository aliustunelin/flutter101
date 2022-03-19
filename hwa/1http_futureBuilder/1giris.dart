//http ve futurebuilder kullanımı
// pubspec'te http eklemek
// http direk böyle çeker
// bu kazma kodu, flutter bize neleri sunuyor


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpHelloView extends StatefulWidget {
  HttpHelloView({Key? key}) : super(key: key);

  @override
  State<HttpHelloView> createState() => _HttpHelloViewState();
}

class _HttpHelloViewState extends State<HttpHelloView> {
  late bool isHaveData = false; 
  String data = "done...";
  
  
  Future getApiDocs() async {
    final data =  (await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"))).body;
    
    
    
    setState(() {
      isHaveData = !isHaveData;
      this.data = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          isHaveData ? Text(data) : CircularProgressIndicator() ,
          ElevatedButton(onPressed: ()async{
              await getApiDocs();
          }, child: Text("Send Request"))
        ]),
      ),
    );
  }
}
