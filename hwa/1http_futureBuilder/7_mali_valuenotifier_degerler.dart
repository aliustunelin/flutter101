// statik değişkeni mainde değiştirmeden ilk hali yazısı geliyor
// valuenotifier da statik tanılanabilir
// alttaki ile int statik farkı int statik dinlenemiyor illaki setstate istiyor 
// ama value notifier statik yapılırsa uygulamanın istenilen yeirnden dinlenebilir

import 'package:flutter/material.dart';

class Degerler{
  static String metin = "ilk hali";
  static ValueNotifier<String> valueNotifierMetin = ValueNotifier<String>("value ilk hali");
}
