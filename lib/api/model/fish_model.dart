class FishModel {
  int id;
  String name;
  String url;
  final ImgSrcSet? imgSrcSet; // Use ImgSrcSet? to allow null
  // Meta meta;

  FishModel({
    required this.id,
    required this.name,
    required this.url,
    required this.imgSrcSet,
    // required this.meta,
  });

  factory FishModel.fromJson(Map<String, dynamic> json) {
    return FishModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      imgSrcSet: json['img_src_set'] != null ? ImgSrcSet.fromJson(json['img_src_set']) : null,
      //  meta: Meta.fromJson(json['meta']),
    );
  }
}

class ImgSrcSet {
  String? x1_5;
  String? x2;

  ImgSrcSet({this.x1_5, this.x2});

  factory ImgSrcSet.fromJson(dynamic json) {
    if (json is String) {
      // Handle the case where the json is a string
      // For example, set both x1_5 and x2 to the string value
      return ImgSrcSet(x1_5: json, x2: json);
    } else if (json is Map<String, dynamic>) {
      // Handle the case where the json is a JSON object
      return ImgSrcSet(
        x1_5: json['1.5x'] is String ? json['1.5x'] : null,
        x2: json['2x'] is String ? json['2x'] : null,
      );
    } else {
      // Handle other cases as needed
      return ImgSrcSet();
    }
  }
}

class Meta {
  String? genera;
  ScientificClassification scientificClassification;

  Meta({this.genera, required this.scientificClassification});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      genera: json['genera'],
      scientificClassification: ScientificClassification.fromJson(json['scientific_classification']),
    );
  }
}

class ScientificClassification {
  String? domain;
  String? kingdom;
  String? phylum;
  String? classValue;
  String? order;
  String? family;
  String? genus;
  String? species;

  ScientificClassification({
    this.domain,
    this.kingdom,
    this.phylum,
    this.classValue,
    this.order,
    this.family,
    this.genus,
    this.species,
  });

  factory ScientificClassification.fromJson(Map<String, dynamic> json) {
    return ScientificClassification(
      domain: json['domain'],
      kingdom: json['kingdom'],
      phylum: json['phylum'],
      classValue: json['class'],
      order: json['order'],
      family: json['family'],
      genus: json['genus'],
      species: json['species'],
    );
  }
}
