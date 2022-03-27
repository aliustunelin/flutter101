//normnalde state içindde değişiklik olduğunda setstate ile bunu algılıyoruz, ancak bu tüö build methodunu ve state'i yeniden renderlıyor
// bunun yerine valuelistenable ile sadece değişkeni dileyebiliriz

//_sayi = ValueNotifier(0); ValueNotifier int gibi dart içinde bir değişten tipi
// valuenotifier sınıfnından değere _sayi.value ile erişirsem içine yazdığımı alırım, direk _sayi deseydim sınıfın kendisine ulaşacaktım

//valuenotifier kullanacağım yerde dinlemenm lazım, direk .value ile çekinde değişiklik yine setstate ihtiyacı duyuyor
// kullanamk istediğimiz wdiget'ı valuelistenablebuilder ile sarıyorum
// valulistenablebuilder generik tip alabilir ve valueListenable: neyi dinleyeceği yanında  builder: (context, value, widget) {  yapısınıda alır içine
//burası aynı sayfa içinde kullandığım



import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ValueNotifier<int> _sayi = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: ValueListenableBuilder<int>(
            valueListenable: _sayi,
            builder: (context, value, widget) {
              // _sayi.value ile erişmek
              //return Text("${_sayi.value}");
              return Text("$value");
            }
          ),
        ),
        body: Center(
          child: Container(
            child:  ElevatedButton(onPressed: () { 
              _sayi.value++;
             },
            child: Text("Tıkla ve Gör")),
          ),
        ),
      ),
    );
  }
}
