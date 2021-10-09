//  provder bir state management şeyi, ve istediğimiz widgetlara data yayınlamımzı sağlar
//  lib içiinde 2 resim var  pro1 pro2 bunlar anlatıyor

//  bu öğretici kod planetten alınıyor, temel kodu gitten alıp başlıyor


// provider paketin ekle


//  bu temel tasarımı aldım, içinde sadece str sehirAdi = adana tutan bir sınıf oluşturdum, 
//  1) bu abimizi state ağacının en üstünde tutman lazım my App üstünde
//  2) asağıda sol veya sağ widgetlarda bu providerı kullanacağım, önce sol wdgetta
//  3)ekranın sağındaki beyaz widget için yapcaz, pro ile çekeceğiz sınıfdaki bilgiyi




// şimdi asıl eğlenceli kısım:   en aşağıdaki widgettan bilgiyi değiştirsem ve statelss widgetlar bunu dinlese ve kendilerini güncellese

//  bunu yapmak için stateData sınıfında kendini dinleyenlere haber verme özelliği kazandıracaz
//  changeNotifier sınıfını extends ediyom,  bunun içinde notifyListener methodu var bunun sayesinde değişiklik olduğuda bunu dinleyen widgetlara haber vermiş olcaz
//  amacım şehir bilgisinde değişiklik yapınca bunu söylemekti, değişiklik için bir method oluşturuyorum her değişikliğin ardında notifyListener() çalıştırıyorum
//          -extends ederken extends yerine with yazarsam birden fazla sınıfdan kalıyım alabilirm yani o sınıfnın direk childı olmamış olur



// ilk 2 adımda basit provider biiz kurtardı ama burada yazacaz, değiştirecez ve okuyacaz yani changeNotifierProvider kullanma durumundayz
//  4ncü adımdan sonra yenisi sınıfta anlacaz





import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider2/state_data.dart';

//myApp'i provider ile sarmaladık, 
//  providera <StateData> kullanacaksın dedik ve create: donecegiSinifWidget()   diede vermiş olduk
//  1'inci adımda state oluşturduk, provider ile statei aşağı yayınladık
void main() => runApp(Provider<StateData>(
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

// provider 2.ci adımda burada dinleyecek
// şimdi ona diyecezki, yukarıda pro yayın yapanlara bak-> stateData yayınlayanı bul -> sonrada onu al
class SolWidgetA extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    // gördün mü, direk gitti provider sınıfının içindeki datayı okudu :)
    String sehirBilgisi = Provider.of<StateData>(context, listen: false).sehirAdi;
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
        TextField(onChanged: null)
      ]),
    );
  }
}