import 'package:fish_radar/api/model/fish_model.dart';
import 'package:fish_radar/api/services/api_service.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../api/model/fish_card_model.dart';
import '../demos/fish_card.dart';

class FishListPage extends StatefulWidget {
  @override
  _FishListPageState createState() => _FishListPageState();
}

class _FishListPageState extends State<FishListPage> {
  ApiService apiService = ApiService();
  final TextEditingController searchController = TextEditingController();
  List<FishModel> originalFishList = [];
  List<FishModel> items = [];
  bool isLoading = true;
  final FocusNode _searchFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    searchController.addListener(queryListener);
    fetchFishData();
  }

  Future<void> fetchFishData() async {
    try {
      // Simulate delay for API call
      await Future.delayed(Duration(seconds: 1));

      List<FishModel> fishList = await apiService.fetchFishData();
      setState(() {
        originalFishList = fishList;
        items = fishList;
        isLoading = false;
      });
    } catch (error) {
      // Handle errors during data fetching
      print("Error fetching fish data: $error");
      setState(() {
        isLoading = false;
      });
    }
  }

  void search(String query) {
    setState(() {
      if (query.isEmpty) {
        items = List.from(originalFishList); // Reset to original list
      } else {
        items = originalFishList
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void queryListener() {
    search(searchController.text);
  }

  @override
  void dispose() {
    searchController.removeListener(queryListener);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Fish Species',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SearchBar(
              controller: searchController,
              focusNode: _searchFocusNode,
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return Colors.white;
              }),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              hintText: "Search fish...",
            ),
          ),
          Expanded(
            child: isLoading
                ? ShimmerGridList()
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      var currentFish = items[index];
                      return currentFish != null
                          ? FishCard(fish: currentFish)
                          : Container();
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ShimmerGridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemCount: 12, // Set the number of grid items
      itemBuilder: (context, index) {
        return shimmerCard();
      },
    );
  }
}
