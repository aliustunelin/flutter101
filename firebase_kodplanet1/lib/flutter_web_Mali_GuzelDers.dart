class AnaSayfa extends StatelessWidget {
  
  
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final double genislik = MediaQuery.of(context).size.width;

    return  Scaffold(
        appBar: AppBar(
          title: Container(width: 130, height: 65, child: Image.asset("assets/flutterlockup.png")),
        ),
        body: Center(
          child: Container(
            child: Row(children: [
              if(genislik>600)
              Expanded(child: SolMenu()),
              Expanded(child: Column(children: [
                  if(genislik<=700) Expanded(child: Contents()),
                   Expanded(child: CookbookMain()),
              ],)),
              if(genislik>700)
              Expanded(child: Contents()),

            ],),
          ),
        ),
        drawer: genislik > 600 ? null : Drawer(child:SolMenu()),
      );
  }
}
