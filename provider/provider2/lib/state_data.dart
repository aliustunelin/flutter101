import 'package:flutter/cupertino.dart';

// 3'cü adım burada oluyor, 
//  abimizi notifierını değişikliğe göre yayılıyoruz
class StateData with ChangeNotifier{
  String sehirAdi = "Adana";

  void changeSehirAdi(String val){
      sehirAdi = val;
      notifyListeners();
  }
}