import 'package:demo1/view/json_placeholder.dart';
import 'package:flutter/material.dart';

//jsonplaceholder gerçek data testi
//lib>model>post.dart
// post modelimde construct tanımlamaları yaptım, buna json serialize işlemi yapmamm lzm
// model dosyam hazır, placeholder view yapiom, lib>view>json_placeholder.dart
//elle yazılmayacak, daha kolay yollar var

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: JsonPlaceholderView(),
        ),
      ),
    );
  }
}
