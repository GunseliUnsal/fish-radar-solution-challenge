import 'package:fish_radar/api/db/hive_model.dart';
import 'package:fish_radar/api/model/fish_model.dart';
import 'package:fish_radar/api/services/api_service.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/card_shimmer.dart';
import 'package:fish_radar/pages/fish_list_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart'; // Import the hive package
import '../api/model/fish_card_model.dart';
import '../demos/fish_card.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final TextEditingController searchController = TextEditingController();
  List<FavoriteFish> originalFishList = [];
  List<FavoriteFish> items = [];
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

      // Open Hive box where favorite fish data is stored
      final box = await Hive.box<FavoriteFish>('favorites');

      // Retrieve data from Hive box
      List<FavoriteFish> fishList = box.values.toList();

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
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Favorite Fish',
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
                          ? FishCard(
                              fish: FishModel(
                                  id: currentFish.id,
                                  name: currentFish.name,
                                  url: "",
                                  imgSrcSet: ImgSrcSet(x1_5: currentFish.img)))
                          : Container();
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
