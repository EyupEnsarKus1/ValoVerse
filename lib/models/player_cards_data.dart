class PlayerCardData {
  String? uuid;
  String? displayName;
  String? displayIcon;
  String? smallArt;
  String? wideArt;
  String? largeArt;

  PlayerCardData({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.smallArt,
    this.wideArt,
    this.largeArt,
  });

  factory PlayerCardData.fromJson(Map<String, dynamic> json) {
    return PlayerCardData(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
      smallArt: json['smallArt'],
      wideArt: json['wideArt'],
      largeArt: json['largeArt'],
    );
  }
}
