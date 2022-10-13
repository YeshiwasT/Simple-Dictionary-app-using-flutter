import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:yemsa_translation/model/readModel.dart';

class API {
  static var client = http.Client();
  
  static Future<ReadModel?> getFile() async {
    final String response = await rootBundle.loadString('asset/dic.json');
    final data = await json.decode(response);
   
    return ReadModel.fromJson(data);
    
  }
}
