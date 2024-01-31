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
          print("Error: JSON data is not a List");
          return [];
        }
      } catch (e) {
        print("Error decoding JSON: $e");
        return [];
      }
    } else {
      print("Error: Non-200 status code - ${response.statusCode}");
      return [];
    }

    /*try {
        if (response.body != null) {
          List myList = jsonDecode(response.body);
            return myList.map((e) => FishModel.fromJson(e)).toList();
          } 
        } else {
          print("Error: JSON data is not a List");
          return [];
        }
      } catch (e) {
        print("Error decoding JSON: $e");
        return [];
      }
    } else {
      print("Error: Non-200 status code - ${response.statusCode}");
      return [];
    }*/
  }
}
