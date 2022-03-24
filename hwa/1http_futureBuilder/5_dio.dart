import 'dart:convert';
import 'package:dio/dio.dart';
import '../../model/home_model/search_model.dart';
import '../../model/villa_details_model/villa_details_model.dart';

class SearchFilterPrice {
  VillaDetailsModel villaDetailsModel = VillaDetailsModel();
  late List priceList = [];
  Dio dio = Dio();
  Future getFilterModel() async {
    var data = {'data': '{"islem":"getHouses","filterType":"TOWN","filterValue":"Marmaris"}'};
    dio = Dio(BaseOptions(
      baseUrl: "https://villarunner.com/",
    ));

    final response =
    await dio.post("mobile-api/index.php", data: FormData.fromMap(data));
    if (response.statusCode == 200) {
      // print(response.data);
      // print("///////////");

      Map<String, dynamic> json = jsonDecode(response.data);
      var filterDataFromJson = json['Houses'];


      for(int i=0; i< filterDataFromJson.length; i++){
        priceList.add(int.parse(filterDataFromJson[i]['price']));
      }

      priceList.sort();

      return {
        "minPrice" : priceList[0],
        "maxPrice" : priceList[priceList.length-1],
      };
      List<dynamic> body = json['Houses'];
      return body;
      print("${body}414141");
      List<Houses> searchHouseList =
      body.map((dynamic item) => Houses.fromJson(item)).toList();
      print("${searchHouseList.length}fövflvöfilvöfdilvölidfövlidfövidföv");
      villaDetailsModel;
      return villaDetailsModel;
    }
    throw Exception();
  }
}
