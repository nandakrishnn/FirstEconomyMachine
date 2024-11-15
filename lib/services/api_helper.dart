import 'dart:convert';
import 'package:firsteconomy/constants/api.dart';
import 'package:firsteconomy/models/data_model.dart';
import 'package:firsteconomy/services/status_codes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

 class ApiServices {
  final ApiEndPoints _apiEnds = ApiEndPoints();
  Future<List<BannerImages>> getBannerImages() async {
    try {
      final response = await http.get(Uri.parse(_apiEnds.url));
      if (response.statusCode == 200) {
      
  final List<dynamic> data = jsonDecode(response.body)['data'];
          return data
              .map((json) => BannerImages.fromJson(json))
              .toList()
              .cast<BannerImages>();
      }else{
         throw Exception(StatusCodes.getMessage(response.statusCode));
      }
  }catch(e){
        debugPrint('Error printing the images $e');
      return [];
  }
}
}
