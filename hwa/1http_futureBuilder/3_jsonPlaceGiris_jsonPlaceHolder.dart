//initStqte içinde post modelini çekelim
//_post modelini çağırmak için toJson ile orası artık bir json data olmuş olcaktır
// get ile gelen datayı okumak içinde fromJson kullancak


import 'package:demo1/model/post.dart';
import 'package:flutter/material.dart';


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
    Post _post = Post(title: "deneme123");
    _post.toJson();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
