// static ile

// main : değişen widget değişkeni buradan değiştirilecek
// > yeniwidget.dart  : değişimin kullanılacağı yer
// > degerler.dart  : statik modeli

//bir değişken tanımlayacağım, uygulamanın her yerinde bunu kullanabileceğim



import 'package:demo1/degerler.dart';
import 'package:flutter/material.dart';

import 'yeniwidget.dart';

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
          child: Column(
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: (){
                    Degerler.metin = "Yeni Hali ${1453}";
                    Degerler.valueNotifierMetin.value = "Value Yeni Hali ${DateTime.now().millisecondsSinceEpoch}";
                  },
                  child: Text("Static Değiştir")),
              ),
              YeniWidget()
            ],
          ),
        ),
      ),
    );
  }
}
