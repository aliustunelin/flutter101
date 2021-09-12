import 'package:flutter/material.dart';

void main() {
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


String? ad, id, kategori;
int? sayfaSayisi;


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
          )
        ],),
      ),
    );
  }

  void veriEkle() {}

  void veriOku() {}

  void veriSil() {}

  void veriGuncelle() {}
}