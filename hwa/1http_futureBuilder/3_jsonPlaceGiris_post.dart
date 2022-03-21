//class model yaptım heemn
//title stringi var bunun ve hemen constructer ekledim 
// amelelik ile json map elle oluşturalım, toJson()
// fromJson var birde, json alcak ve return ettiğinde Post datası dönecek
 
 class Post{
   late final String title;
   

    Post({required this.title});



    toJson(){
      Map<String, dynamic> data = Map<String, dynamic>();
      data['title'] = this.title;
      return data;
    }

    Post.fromJson(Map<String, dynamic> json){
        this.title = json['title'];
    }
 }
