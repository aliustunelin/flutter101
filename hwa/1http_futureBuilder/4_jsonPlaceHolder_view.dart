// modeli jsontodart yaptım, artık feature ytaziom


import 'dart:convert';

import 'package:demo1/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class JsonPlaceholderView extends StatefulWidget {
  JsonPlaceholderView({Key? key}) : super(key: key);

  @override
  State<JsonPlaceholderView> createState() => _JsonPlaceholderViewState();
}

class _JsonPlaceholderViewState extends State<JsonPlaceholderView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  //http get feature
  // bu abimiz FutureBuilder<Post> ile gelecek data'nın tipinden olabilir, gözün korkmasın
  Future getJsonPlaceHolderData() async {
    return await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: getDataFutureWidget(),
      ),
    );
  }


  // FutureBuilder'ada dynamic type veriyorum ve gelenin Post tipinde data yakalayacam diorsunuz
  //eskiden direk snapshot.data ile alıyordun, artık model içinden json'dan çevirerek içine alıyorum
  // fromJSon ile içinde aldığımda, içerisindeki fieldlar özelliği olarak geliyor cost.title.toString
  FutureBuilder<dynamic> getDataFutureWidget() {
    return FutureBuilder(
        future: getJsonPlaceHolderData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            //normali bu'da
            //var cost = Post.fromJson(json.decode(snapshot.data));
            final _mapJson = json.decode(snapshot.data.body);
            var cost = Post.fromJson(_mapJson);
            return ListTile(
            title: Text(cost.title.toString()),
            subtitle: Text(cost.body.toString()),
          );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
          
        },
      );
  }
}
