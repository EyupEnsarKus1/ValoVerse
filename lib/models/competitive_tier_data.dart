class CompetitiveTierData {
  int? tier;
  String? tierName;
  String? division;
  String? divisionName;
  String? color;
  String? backgroundColor;
  String? smallIcon;
  String? largeIcon;
  String? rankTriangleDownIcon;
  String? rankTriangleUpIcon;

  CompetitiveTierData({
    this.tier,
    this.tierName,
    this.division,
    this.divisionName,
    this.color,
    this.backgroundColor,
    this.smallIcon,
    this.largeIcon,
    this.rankTriangleDownIcon,
    this.rankTriangleUpIcon,
  });

  factory CompetitiveTierData.fromJson(Map<String, dynamic> json) {
    return CompetitiveTierData(
      tier: json['tier'],
      tierName: json['tierName'],
      division: json['division'],
      divisionName: json['divisionName'],
      color: json['color'],
      backgroundColor: json['backgroundColor'],
      smallIcon: json['smallIcon'],
      largeIcon: json['largeIcon'],
      rankTriangleDownIcon: json['rankTriangleDownIcon'],
      rankTriangleUpIcon: json['rankTriangleUpIcon'],
    );
  }
}
