// provider_oncesi.dart içinde provider kullnamadan bir sayfa widgdan baika widgeta gönderdik willpoposcope ile
// şimdii provider zamannı

// model dosyam var, içinde sepet_provider oluşturudum. Onda ChangeNotifier var yani değiştirilebilir obje demmk
//    provider öncesi klasörnde temel_model var. Onda belli oluuyor zzaten, değişiklik yapıldığında değişikliği listener ediyon

// başlayalım:  maini changeNotifierProvider ile sarıyorum onun create'i zorunlu, neyi model alacağın create ediyorum
//  runapp() içinde SepetModel'imi create ettim 
// runApp'i create ettiğim gibi biirnic sınıf içine bir consumer<Model> koyuyorum
//    bu consumer içine builder alıyor yapı biraz değişiyor ayık ol, (builder: (context, value, child)
//bu builder dışında herşey aynı kalıyor onada dikkat

//  bu işlemi yapınca ilk sayfada veriyi counter değişkeninden alıyorduk artk ona gerek kalmadı builder içindeki value onun yerine geçmiş oldu
// result ve setstate içinde değeri döndermiştim onada gerek kalmadı artık
//  diğer sayfayaya parametre ile sepet göndermiştim onada gerek yok artık
//  ikinci sayfada sepet değişkeninede gerek yk artık
//  ikinci sayfada willpopscope da gerekmiyor artık

//  ikinci sayfada göstereceğim değeride sildim provider ile alcam die o yüzden ikinci kısma bir initState atalım ve değeri okuyalım
//  ikinci sayfada arttırıcı butonun onpressine setstate koyduk bundada gerek kalmadı artık direk değeri arttırıp providerın içine yazıyorum

// bu providerın sadece 1 kullanımı



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/provider_oncesi/temel_model.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (context) => SepetModel(),
  child: MyApp()));

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
  

  @override
  Widget build(BuildContext context) {
    //  tüm widgetı consumer ile sardım consumer: tüketici demek ve sepet modeli içine verdim ki bu model üzerindeki valueyu dinlesin value.degisken ilede onu çekebileyim
    return Consumer<SepetModel>(builder: (context, value, child){
      return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                  Text(value.sepet.toString()),
                  // provider olduğu için direk diğer sayfaya gittim, oradan gelen derğer okumak için willpopscope yerine provider değişkenini kullanacağım
                  ElevatedButton(onPressed: ()async{
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );          
                  }, 
                  child: Text("İkinci Sayfaya Git"))
            ],
          ),
        );
    });
  }
}





class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {  
  int okunanDeger = 0;
  @override
  void initState() {
    super.initState();
    okunanDeger = Provider.of<SepetModel>(context, listen: false).sepetitems;
  }

  @override
  Widget build(BuildContext context) {
    //providersız geri döndüğünde içindekini attı die pop edince içindekini geriye gönderecek ve gerideki resutl değişkenine atmış olcak
    return Scaffold( 
      appBar: AppBar(title: Text("İkinci Sayfa"),),
      body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("İkinci Sayfa"),
          Text(okunanDeger.toString()),
            ElevatedButton(onPressed: (){
                        setState(() {
                          okunanDeger++;
                        });
                        //okunan değeri direk providerın içine yazdım
                        Provider.of<SepetModel>(context, listen: false).setvalue(okunanDeger);
                    }, child: Text("Sepete Ürün Ekle!"))
        ],
      ),
    ),
    );
  }
}


















//    extra bilgiler:


/*
          provider ile ilgili

    future yazmış isen:
                










*/