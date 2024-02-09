// lib/services/api_service.dart
import 'dart:convert';
import 'package:fish_radar/api/model/fish_model.dart';
import 'package:fish_radar/api/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<FishModel>> fetchFishData() async {
    final String response = await rootBundle.loadString('assets/fish.json');
    List<dynamic> jsonList = jsonDecode(response);
    List<FishModel> fishListOffline =
        jsonList.map((fish) => FishModel.fromJson(fish)).toList();
    return fishListOffline;
  }
}
