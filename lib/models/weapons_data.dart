class WeaponsData {
  String? uuid;
  String? displayName;
  String? displayIcon;
  List<WeaponStats>? weaponStats;
  List<ShopData>? shopData;
  List<Skins>? skins;

  WeaponsData({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.weaponStats,
    this.shopData,
    this.skins,
  });

  factory WeaponsData.fromJson(Map<String, dynamic> json) {
    return WeaponsData(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
      weaponStats: (json['weaponStats'] as List<dynamic>?)
          ?.map((stats) => WeaponStats.fromJson(stats))
          .toList(),
      shopData: (json['shopData'] as List<dynamic>?)
          ?.map((shop) => ShopData.fromJson(shop))
          .toList(),
      skins: (json['skins'] as List<dynamic>?)
          ?.map((skin) => Skins.fromJson(skin))
          .toList(),
    );
  }
}

class WeaponStats {
  double? fireRate;
  double? magazineSize;
  double? equipTimeSeconds;
  double? reloadTimeSeconds;
  List<DamageRanges>? damageRanges;

  WeaponStats({
    this.fireRate,
    this.magazineSize,
    this.equipTimeSeconds,
    this.reloadTimeSeconds,
    this.damageRanges,
  });

  factory WeaponStats.fromJson(Map<String, dynamic> json) {
    return WeaponStats(
      fireRate: json['fireRate'],
      magazineSize: json['magazineSize'],
      equipTimeSeconds: json['equipTimeSeconds'],
      reloadTimeSeconds: json['reloadTimeSeconds'],
      damageRanges: (json['damageRanges'] as List<dynamic>?)
          ?.map((range) => DamageRanges.fromJson(range))
          .toList(),
    );
  }
}

class DamageRanges {
  double? rangeStartMeters;
  double? rangeEndMeters;
  double? headDamage;
  double? bodyDamage;
  double? legDamage;

  DamageRanges({
    this.rangeStartMeters,
    this.rangeEndMeters,
    this.headDamage,
    this.bodyDamage,
    this.legDamage,
  });

  factory DamageRanges.fromJson(Map<String, dynamic> json) {
    return DamageRanges(
      rangeStartMeters: json['rangeStartMeters'],
      rangeEndMeters: json['rangeEndMeters'],
      headDamage: json['headDamage'],
      bodyDamage: json['bodyDamage'],
      legDamage: json['legDamage'],
    );
  }
}

class ShopData {
  double? cost;
  String? category;
  String? image;
  String? newImage;

  ShopData({
    this.cost,
    this.category,
    this.image,
    this.newImage,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) {
    return ShopData(
      cost: json['cost'],
      category: json['category'],
      image: json['image'],
      newImage: json['newImage'],
    );
  }
}

class Skins {
  String? uuid;
  String? displayName;
  String? displayIcon;

  Skins({
    this.uuid,
    this.displayName,
    this.displayIcon,
  });

  factory Skins.fromJson(Map<String, dynamic> json) {
    return Skins(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
    );
  }
}
