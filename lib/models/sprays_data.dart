class SprayData {
  String? uuid;
  String? displayName;
  String? fullTransparentIcon;

  SprayData({
    this.uuid,
    this.displayName,
    this.fullTransparentIcon,
  });

  factory SprayData.fromJson(Map<String, dynamic> json) {
    return SprayData(
      uuid: json['uuid'],
      displayName: json['displayName'],
      fullTransparentIcon: json['fullTransparentIcon'],
    );
  }
}
