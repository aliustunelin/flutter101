import 'package:flutter/material.dart';

class SepetModel extends ChangeNotifier{
  int sepet = 0;
  int get sepetitems => sepet;

  void setvalue(int value){
    sepet = value;
    notifyListeners();
  }

  void reset(){
    sepet = 0;
    notifyListeners();
  }

}