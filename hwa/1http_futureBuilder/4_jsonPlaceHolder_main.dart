//jsonToDart kullanımı
//json annotation pubdev'de paket var

// placeholder'dan aldım json bunun 1 elemanını jsontodart'ta ekliyorum o bana fromJson toJson oluşturuyor
//post dosyasına bunu koyuyorum heeemmen

// model dosyam babalr gibi, artuk view içinde feature tanımlayabilirim, getJsonPlaceHolderData gibi

import 'package:demo1/view/json_placeholder.dart';
import 'package:flutter/material.dart';


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
