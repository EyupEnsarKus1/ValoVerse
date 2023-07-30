class MapData {
  String? uuid;
  String? displayName;
  String? coordinates;
  String? listViewIcon;
  String? displayIcon;

  MapData({
    this.uuid,
    this.displayName,
    this.coordinates,
    this.listViewIcon,
    this.displayIcon,
  });

  factory MapData.fromJson(Map<String, dynamic> json) {
    return MapData(
      uuid: json['uuid'],
      displayName: json['displayName'],
      coordinates: json['coordinates'],
      listViewIcon: json['listViewIcon'],
      displayIcon: json['displayIcon'],
    );
  }
}
