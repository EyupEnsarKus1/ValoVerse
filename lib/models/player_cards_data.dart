class PlayerCardData {
  String? uuid;
  String? displayName;
  String? largeArt;

  PlayerCardData({
    this.uuid,
    this.displayName,
    this.largeArt,
  });

  factory PlayerCardData.fromJson(Map<String, dynamic> json) {
    return PlayerCardData(
      uuid: json['uuid'],
      displayName: json['displayName'],
      largeArt: json['largeArt'],
    );
  }
}
