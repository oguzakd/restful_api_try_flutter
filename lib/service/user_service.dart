import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restful_api_try/model/user_model.dart';
import 'package:http/http.dart' as http;
class UserService{
  final String url = "https://reqres.in/api/users?page=2";
  
  Future<UsersModel?> fetchUsers() async{
    // istek atıyoruz
    var res = await http.get(Uri.parse(url));

    // çekme işleminin başarılı olma durumu
    if(res.statusCode == 200) {
      // Gelen veri jsonBody değişkenine atandı
      var jsonBody = UsersModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    }else{
      debugPrint("Çekme işlemi başarısız");
    }
  }
}