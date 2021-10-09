// provider? Bir widgetTaki veriyi başka bir widget üzerine atmak
// alışveriş yaparken sepete ürün gireceğim? klasik problem...
// main yanındaki wdgetta counter sayacak ve onu secondPage'e gönderecek
// secondPage içinde bir buton olacak ve bu buton sepete ekleyerek sayıyı arttıracak
//      secondPage için kolay aynı sayfada ama main yanındaki counter'ı provider ile arttıracağız

// 1) yapma yöntemi:>    birinci sayfada giden onpress içindeki methodu future yaptık
//                        setstate ile bu değeri sayıcıya attık
//                        sonra ikinci sayfayı wilpopscope ile sardım onunda onWillPop özelliği içine


//gücel yukarıdaki 1->1 de çalıştı ama bundan daha karmaşık yapılar olduğunu düşünelim  cevap: provider

import 'dart:async';

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
        body: MalBunlarinHepsi(),
      ),
    );
  }
}

class MalBunlarinHepsi extends StatefulWidget {
  MalBunlarinHepsi({Key? key}) : super(key: key);

  @override
  _MalBunlarinHepsiState createState() => _MalBunlarinHepsiState();
}

class _MalBunlarinHepsiState extends State<MalBunlarinHepsi> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                  Text(counter.toString()),
                  //burada future olarak push'un döneceği seyi bekledim, ileride geri dönüşte pop yapcam tabiki willpopscope ile bunu yakalayıp result içine alcam 
                  ElevatedButton(onPressed: ()async{
                   var result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage(sepet: counter)),
                  );
                  setState(() {
                    counter = result;
                  });
                  }, 
                  child: Text("İkinci Sayfaya Git"))
            ],
          ),
        );
  }
}





class SecondPage extends StatefulWidget {
  late int sepet;
  SecondPage({required this.sepet});  

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    //providersız geri döndüğünde içindekini attı die pop edince içindekini geriye gönderecek ve gerideki resutl değişkenine atmış olcak
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, widget.sepet);
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(title: Text("İkinci Sayfa"),),
        body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("İkinci Sayfa"),
            Text(widget.sepet.toString()),
              ElevatedButton(onPressed: (){
                          setState(() {
                            widget.sepet++;
                          });
                      }, child: Text("Sepete Ürün Ekle!"))
          ],
        ),
      ),
      ),
    );
  }
}