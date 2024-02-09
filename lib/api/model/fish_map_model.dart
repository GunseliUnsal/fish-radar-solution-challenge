class FishMapModel {
  String fishName;
  String description;
  bool warning;
  String? warningDescription; 

  FishMapModel({
    required this.fishName,
    required this.description,
    this.warning = false,
    required this.warningDescription,
  });

  factory FishMapModel.fromJson(Map<String, dynamic> json) {
    return FishMapModel(
      fishName: json['fish_name'],
      description: json['description'],
      warning: json['warning'],
      warningDescription: json['warning_description'] ?? "",
    );
  }
}
