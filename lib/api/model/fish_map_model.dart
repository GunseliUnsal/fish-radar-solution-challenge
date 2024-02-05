class FishMapModel {
  String imageURL;
  String name;
  String description;
  bool isFavorite;

  final Function() onTap;

  FishMapModel({
    required this.imageURL,
    required this.name,
    required this.description,
    this.isFavorite = false,
    required this.onTap,
  });
}
