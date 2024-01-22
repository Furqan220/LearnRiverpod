

import 'dart:convert';

import 'package:testapp/riverpod_providers/future_provider_example.dart/user_model.dart';

import 'package:http/http.dart' as http;

class ApiService {

  final String url = "https://reqres.in/api/users?page=2" ;

  Future<List<UserModel>> getUsers()async{
    
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body.toString())["data"];
      return result.map((e) => UserModel(map: e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }

  }


}