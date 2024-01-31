import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class FavoriteFish {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String img;

  FavoriteFish({
    required this.id,
    required this.name,
    required this.img,
  });
}
