import 'package:fish_radar/api/model/fish_model.dart';
import 'package:fish_radar/api/services/api_service.dart';
import 'package:flutter/material.dart';
import 'fish_card.dart';
import 'endangered_fish.dart';

class FishListPage extends StatefulWidget {
  const FishListPage({super.key});

  @override
  _FishListPageState createState() => _FishListPageState();
}

class _FishListPageState extends State<FishListPage> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<FishModel>>(
        future: apiService.fetchFishData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<FishModel>? fishList = snapshot.data;
            debugPrint(fishList.toString());

            if (fishList != null && fishList.isNotEmpty) {
              return ListView.builder(
                itemCount: fishList.length,
                itemBuilder: (context, index) {
                  FishModel? currentFish = fishList[index];
                  return EndangeredFishCard(fish: currentFish);
                },
              );
            } else {
              return const Center(
                child: Text(
                  'No fish data available.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
