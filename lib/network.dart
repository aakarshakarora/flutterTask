import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'model.dart';

class Network
{
  Future<TestMap> getAxis({BuildContext context})async
  {
    var apiURL="http://www.json-generator.com/api/json/get/bUcXQDFVMy?indent=2";
    final response = await get(Uri.encodeComponent(apiURL));
        String data = await DefaultAssetBundle
            .of(context)
            .loadString("assets/qwerty.json");

    if(response.statusCode==200) {
      print("Hello Data: ${response.body}");
      return TestMap.fromJson(jsonDecode(response.body));
    }
    else
      throw Exception("Error is there");



  }

  // Future<TestMap> getAxis({BuildContext context}) async {
  //   try {
  //     String data = await DefaultAssetBundle
  //         .of(context)
  //         .loadString("assets/qwerty.json");
  //     return json.decode(data);
  //   } catch (e) {
  //     print("Error is there $e");
  //   }
  // }
}