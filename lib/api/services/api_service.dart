// lib/services/api_service.dart
import 'dart:convert';
import 'package:fish_radar/api/model/fish_model.dart';
import 'package:fish_radar/api/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<FishModel>> fetchFishData() async {
    const String apiUrl = Constants.API_URL; // Replace with your actual API URL

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'X-RapidAPI-Key': Constants.API_KEY,
        'X-RapidAPI-Host': Constants.API_HOST,
      },
    );

    if (response.statusCode == 200) {
      try {
        if (response.body != null) {
          List<dynamic> jsonList = jsonDecode(response.body.toString());
          List<FishModel> fishList =
              jsonList.map((e) => FishModel.fromJson(e)).toList();
          return fishList;
        } else {
          print("else ERROR");
          final String response =
              await rootBundle.loadString('assets/sample.json');
          List<dynamic> jsonList = jsonDecode(response);
          List<FishModel> fishListOffline =
              jsonList.map((e) => FishModel.fromJson(e)).toList();
          return fishListOffline;
        }
      } catch (e) {
        print("CATCH ERROR");
        final String response =
            await rootBundle.loadString('assets/sample.json');
        List<dynamic> jsonList = jsonDecode(response);
        List<FishModel> fishListOffline =
            jsonList.map((fish) => FishModel.fromJson(fish)).toList();
        return fishListOffline;
      }
    } else {
      print("else2 ERROR");
      final String response = await rootBundle.loadString('assets/sample.json');
      List<dynamic> jsonList = jsonDecode(response);
      List<FishModel> fishListOffline =
          jsonList.map((e) => FishModel.fromJson(e)).toList();
      return fishListOffline;
    }
  }
}
