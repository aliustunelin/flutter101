//  burası 4ncü adımı temsil eder
//   bu ders serisinde consumersız yapılmıştır
//      consumer widget ağacının bir kısmını çevreleyerek bu derslerde yapıldığığ gibi provider diye dinlemek yerine otomatik dinlemeye alıyor güzeldir.


// artık buradan sorna changeNotifierProvider kullanacağız
// 4) myApp üzerindeki provider tipini değiştir
// çünkü sınıfımız notifier edilebilen bir sınıftan extends oldu, o zmaan dinleyende notifier edebilen bir halde olmalıdır
//    provider anlamında başka değişiklik yapmıyorum

// 5 adım beşte textfield üzerindeki işlemelr olcak textfielddaki veriyi okuyup sınıf içidneki methoda atcaz yeni şehir ismini oradanda zaten provider bizim için notify edecek veriyi
// 5'in içinde özel: provider ile model sınıfımın içindeki veriye ulaştığım gibi methodarada ulaşabilirm


//  ek bilgi: 
//     bu listen true false meselesi:
//        listen provider modelini dinler, eğer Provider.of<StateData>(context).changeSehirAdi("Mersin");  gibi kullanırsak hem dinleyip (true) hemde yazmaya çalışır. Bu mümkün deil
//                                            bu yüzden içerisine listen ile dinlemeyi manuel olarak kontrol etmek gereklidir


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider2/state_data.dart';


void main() => runApp(ChangeNotifierProvider<StateData>(
  create:(context) {
    return StateData();
  },
  child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('callback kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: SolWidgetA()),
            Expanded(child: SagWidgetA())
          ],
        ),
      ),
    );
  }
}


class SolWidgetA extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    String sehirBilgisi = Provider.of<StateData>(context, listen: true).sehirAdi;
    return Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Text(
              'Sol Widget',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Sehir: $sehirBilgisi ',
              style: TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}

class SagWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(children: [
        Text(
          'SagWidget A',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetB()
      ]),
    );
  }
}

class SagWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      child: Column(children: [
        Text(
          'SagWidget B',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetC()
      ]),
    );
  }
}

class SagWidgetC extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Function newCity = Provider.of<StateData>(context).changeSehirAdi;
    String SehirBilgisi = Provider.of<StateData>(context).sehirAdi;
    return Container(
      color: Colors.white,
      height: 150,
      width: 160,
      child: Column(children: [
        Text(
          'SagWidget C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Şehir: $SehirBilgisi ',
          style: TextStyle(fontSize: 20),
        ),
        // textfield içinde provider ile modelimdeki değiştirme methodunu çağırdım        
        TextField(onChanged: (input){
          newCity(input);
        })
      ]),
    );
  }
}