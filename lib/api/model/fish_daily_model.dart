class FishDailyModel {
  String? day;
  int? fishID;
  List<int>? preSelectedFish;

  FishDailyModel({this.day, this.fishID, this.preSelectedFish});

  factory FishDailyModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? preSelectedFishJson = json['preSelectedFish'];
    List<int>? preSelectedFish =
        preSelectedFishJson?.map((e) => e as int).toList();
    return FishDailyModel(
      day: json['day'] ?? "",
      fishID: json['fishID'] ?? -1,
      preSelectedFish: preSelectedFish,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'fishID': fishID,
      'preSelectedFish': preSelectedFish,
    };
  }
}
