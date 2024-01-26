class FishCard {
  String imageURL;
  String name;
  String description;
  bool isFavorite;

  FishCard({
    required this.imageURL,
    required this.name,
    required this.description,
    this.isFavorite = false,
  });
}
