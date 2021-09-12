import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//1firebasein projeye eklenmesi ve kolları sıvama
//2app build gradle içindeki minSdkVersion 16->21 yapıldı
//3 okuma yazma güncellem silme fonklarının içini doldurdum
//4 verileri liste halinde listview gösterme {streamBuilder}






void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirebaseCrud(),
  ));
  
}



class FirebaseCrud extends StatefulWidget {
  FirebaseCrud({Key? key}) : super(key: key);

  @override
  _FirebaseCrud createState() => _FirebaseCrud();
}

class _FirebaseCrud extends State<FirebaseCrud> {


late String ad, id, kategori;
late int sayfaSayisi;



//////////////////////////////
/// METOTLAR OLUŞTURULUOR

 idAl(idTutucu){
   this.id = idTutucu;

}

  adAl(adTutucu){
  this.ad = adTutucu;
}


  kategoriAl(kategoriTutucu){
  this.kategori = kategoriTutucu;
}

  sayfaSayisiAl(sayfaTutucu){
  this.sayfaSayisi = int.parse(sayfaTutucu);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Crud"), centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: TextFormField(
              onChanged: (String idTutucu){
                idAl(idTutucu);
              },
              decoration: InputDecoration(labelText: "Kitap Id", focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45, width: 2))), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: TextFormField(
              onChanged: (String adTutucu){
                adAl(adTutucu);
              },
              decoration: InputDecoration(labelText: "Kitap Adı", focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45, width: 2))), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: TextFormField(
              onChanged: (String kategoriTutucu){
                kategoriAl(kategoriTutucu);
              },
              decoration: InputDecoration(labelText: "Kitap Kategorisi", focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45, width: 2))), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: TextFormField(
              onChanged: (String sayfaTutucu){
                sayfaSayisiAl(sayfaTutucu);
              },
              decoration: InputDecoration(labelText: "Kitap Sayfa Sayısı", focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45, width: 2))), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: (){
                    veriEkle();
                  }, child: Text("Ekle"), style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shadowColor: Colors.redAccent,
                    elevation: 5,
                  ),),
                ),
                 Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: (){
                    veriOku();
                  }, child: Text("Oku"), style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.white,
                    shadowColor: Colors.redAccent,
                    elevation: 5,
                  ),),
                ),
                 Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: (){
                    veriSil();
                  }, child: Text("Sil"), style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    shadowColor: Colors.redAccent,
                    elevation: 5,
                  ),),
                ),
                 Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: (){
                    veriGuncelle();
                  }, child: Text("Güncelle"), style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shadowColor: Colors.redAccent,
                    elevation: 5,
                  ),),
                )
              ],
            ),
          ),

          //streamBuilder
            //verileri listeleyelim
            //streamBuilder akış inşaa edici
            //önce stream (akış) halledilir
            
            //stream veritabanından akışın olcağı yoldaki veriler snpashots
            // builder inşaa edici kısım, (builder, context)
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Kitaplik").snapshots(),
              builder: (builder, alinanVeri) {    
                if(alinanVeri.hasError){
                  return Text("Aktarım Başarısız...!");
                }
                
              return ListView.builder(
                shrinkWrap: true,
                itemCount: alinanVeri.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  //satır verisi gösterilior
                DocumentSnapshot satirVerisi = alinanVeri.data.docs[index];
                return Row(
                  children: [
                        Expanded(child: Text(satirVerisi["kitapAd"])),
                        Expanded(child: Text(satirVerisi["kitapId"]))
                  ],
                );
               },
              );
            }
            )





        ],),
      ),
    );
  }

  void veriEkle() {
    // veri yolu ekleme
    DocumentReference veriYolu = FirebaseFirestore.instance.collection("Kitaplik").doc(id);

    //çoklu veri için map
    Map<String, dynamic> kitaplar = {
      "kitapID": id,
      "kitapAd": ad,
      "kitapKategori": kategori,
      "kitapSayfaSayisi": sayfaSayisi.toString()
    };


  //veriyi veritabanınıa ekle
  veriYolu.set(kitaplar).whenComplete(()  {
    Fluttertoast.showToast(msg: id +" ID'li Kitap Eklendi");
  });

  }
  
  void veriOku() {
        
    //veri yolumu tanıtıp, veriyi aldım, idye göre getiriyor ayık ol
    DocumentReference veriOkumaYolu = FirebaseFirestore.instance.collection("Kitaplik").doc(id);
    veriOkumaYolu.get().then((alinanDeger){
        //çoklu veri gelioyr map aktarma
        Map<String, dynamic> alinanVeri = alinanDeger.data() as Map<String, dynamic>;

        //alınan verilerdeki dataları parse
        String idTutucu = alinanVeri["kitapID"];
        String adTutucu = alinanVeri["kitapAd"];
        String kategoriTutucu = alinanVeri["kitapKategori"];
        String sayfaTutucu = alinanVeri["kitapSayfaSayisi"];


        //tutucuları gösterme
        Fluttertoast.showToast(msg: "Id:" + idTutucu + " Ad:" + adTutucu + " Kategori:" + kategoriTutucu + " Sayfa Sayisi:" + sayfaTutucu);

    });

  }

  void veriSil() {
    
    //veri yolu
    DocumentReference veriSilmeYolu = FirebaseFirestore.instance.collection("Kitaplik").doc(id);

    //veriyi silme
    veriSilmeYolu.delete().whenComplete(() {
      Fluttertoast.showToast(msg: id + " ID'li Kitap Silindi!");
    });
  }

  void veriGuncelle() {
    //Veri yolu
    DocumentReference veriGuncellemeYolu = FirebaseFirestore.instance.collection("Kitaplik").doc(id);

    //çoklu veri için map
    Map<String, dynamic> guncellenecekVeri = {
      "kitapID": id,
      "kitapAd": ad,
      "kitapKategori": kategori,
      "kitapSayfaSayisi": sayfaSayisi.toString()
    };

    //veriyi güncelle
    veriGuncellemeYolu.update(guncellenecekVeri).whenComplete(() {
      Fluttertoast.showToast(msg: id + " Id'li Kitap Güncellendi!");
    });
  }
}