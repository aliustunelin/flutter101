// önceki kodda sildiğimiz kısımlar
//center altı tamamen gitti,
// getApi fonk içindeki setstate gitti,
// baştaki değişkenler gitti
//scaffold altına direk futurebuilder ekliyorum

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpHelloView extends StatefulWidget {
  HttpHelloView({Key? key}) : super(key: key);

  @override
  State<HttpHelloView> createState() => _HttpHelloViewState();
}

class _HttpHelloViewState extends State<HttpHelloView> {
 
  
  Future getApiDocs() async {
    (await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"))).body;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // futureBuilder future özelliği gelecekte yapcağı iş
        future: getApiDocs(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            //üstteki if bağlantı, hasData veri varsa
            if(snapshot.hasData){
               return Text(snapshot.data.toString());
            }else{
              return Center(child: Text("yazio"));
            }
          }
          return CircularProgressIndicator();
        },
      )
    );
  }
}
