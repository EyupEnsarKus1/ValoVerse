class SprayData {
  String? uuid;
  String? displayName;
  String? category;
  String? displayIcon;
  String? fullIcon;
  String? fullTransparentIcon;
  String? animationPng;
  String? animationGif;
  List<SprayLevel>? levels;

  SprayData({
    this.uuid,
    this.displayName,
    this.category,
    this.displayIcon,
    this.fullIcon,
    this.fullTransparentIcon,
    this.animationPng,
    this.animationGif,
    this.levels,
  });

  factory SprayData.fromJson(Map<String, dynamic> json) {
    return SprayData(
      uuid: json['uuid'],
      displayName: json['displayName'],
      category: json['category'],
      displayIcon: json['displayIcon'],
      fullIcon: json['fullIcon'],
      fullTransparentIcon: json['fullTransparentIcon'],
      animationPng: json['animationPng'],
      animationGif: json['animationGif'],
      levels: (json['levels'] as List<dynamic>?)
          ?.map((level) => SprayLevel.fromJson(level))
          .toList(),
    );
  }
}

class SprayLevel {
  String? uuid;
  int? sprayLevel;
  String? displayName;
  String? displayIcon;

  SprayLevel({
    this.uuid,
    this.sprayLevel,
    this.displayName,
    this.displayIcon,
  });

  factory SprayLevel.fromJson(Map<String, dynamic> json) {
    return SprayLevel(
      uuid: json['uuid'],
      sprayLevel: json['sprayLevel'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
    );
  }
}
