class MapData {
  String? uuid;
  String? displayName;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;

  MapData({
    this.uuid,
    this.displayName,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.splash,
  });

  factory MapData.fromJson(Map<String, dynamic> json) {
    return MapData(
      uuid: json['uuid'],
      displayName: json['displayName'],
      coordinates: json['coordinates'],
      displayIcon: json['displayIcon'],
      listViewIcon: json['listViewIcon'],
      splash: json['splash'],
    );
  }
}
