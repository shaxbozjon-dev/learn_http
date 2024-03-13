import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_http/repository/model/model.dart';
import 'package:learn_http/servise/local_database.dart';

//get bazadan malumot olish uchun
//post bazadan malumot yuborish uchun
//put bazaga malumot junatish uchun
//delete bazadan malumot ochirish uchun
class LessonRepository {
  static Future<Model?> getData() async {
    //funksiya tuzdi future
    try {
      final res = await http.get( //http .get
          Uri.parse("https://fakestoreapi.com/products/1"),
          headers: {
            "Contentsadfdsfd-Type": "Application/json"
          });
      final jsonBody = jsonDecode(res.body);
      final response = Model.fromJson(jsonBody);
      return response;
    } catch (e) {
      throw Exception("Xatolik buldi");
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>> getListData() async {
    //funksiya tuzdi future
    try {
      final res = await http.get( //http .get
          Uri.parse("https://fakestoreapi.com/products/"),
          headers: {

            "Contentsadfdsfd-Type": "Application/json"
          });
      LocalStrage().setString(key: 'data', value: res.body);
      final jsonBody = jsonDecode(res.body);
      List<Map<String, dynamic>>dataList = [];

      for (final item in jsonBody ?? []) {
        dataList.add(item);
      }

      return dataList;
    } catch (e) {
      final localData=LocalStrage().getString(key: "data");
      final res=jsonDecode(localData??"");
      List<Map<String, dynamic>>dataList = [];

      for (final item in res ?? []) {
        try{
          dataList.add(item);
        }
        catch(e){
          print("$e");
        }

      }

      return dataList;


    }
  }


}
