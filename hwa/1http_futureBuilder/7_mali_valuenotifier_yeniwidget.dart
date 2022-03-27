// statik geln valuenotifier burada dinlendi
// value kısmı var ya içinde onu kesin ValueListenableBuilder<String>( içinde kulanmalı

import 'package:flutter/material.dart';

import 'degerler.dart';


class YeniWidget extends StatelessWidget {
  const YeniWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Degerler.metin),
           ValueListenableBuilder<String>(
             valueListenable:  Degerler.valueNotifierMetin,
             builder: ( context,  value,  child) {
               return  Text(value);
             },
           ),
      ],
    );
  }
}
