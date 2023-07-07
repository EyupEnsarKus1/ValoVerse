class BuddyData {
  String? uuid;
  String? displayName;
  String? displayIcon;
  List<BuddyLevel>? levels;

  BuddyData({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.levels,
  });

  factory BuddyData.fromJson(Map<String, dynamic> json) {
    return BuddyData(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
      levels: (json['levels'] as List<dynamic>?)
          ?.map((level) => BuddyLevel.fromJson(level))
          .toList(),
    );
  }
}

class BuddyLevel {
  String? uuid;
  int? charmLevel;
  String? displayName;
  String? displayIcon;

  BuddyLevel({
    this.uuid,
    this.charmLevel,
    this.displayName,
    this.displayIcon,
  });

  factory BuddyLevel.fromJson(Map<String, dynamic> json) {
    return BuddyLevel(
      uuid: json['uuid'],
      charmLevel: json['charmLevel'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
    );
  }
}
