import 'package:fish_radar/api/db/hive_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:hive/hive.dart';

class HiveService {
  static late Box<FavoriteFish> _favoritesBox;

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavoriteFishAdapter());
    _favoritesBox = await Hive.openBox<FavoriteFish>('favorites');
  }

  static Box<FavoriteFish> get favoritesBox => _favoritesBox;

  static Future<Box<FavoriteFish>> get favoritesBoxFuture async {
    await initHive(); // Ensure Hive is initialized before returning the box
    return _favoritesBox;
  }

  static Future<void> putFavoriteFish(FavoriteFish favoriteFish) async {
    await _favoritesBox.put(favoriteFish.id, favoriteFish);
  }

  static Future<void> deleteFavoriteFish(String fishId) async {
    await _favoritesBox.delete(fishId);
  }
}
