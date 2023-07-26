class WeaponsData {
  String? uuid;
  String? displayName;
  String? category;
  String? displayIcon;
  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skins>? skins;

  WeaponsData(
      {this.uuid,
      this.displayName,
      this.category,
      this.displayIcon,
      this.weaponStats,
      this.shopData,
      this.skins});

  WeaponsData.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    category = json['category'];
    displayIcon = json['displayIcon'];
    weaponStats = json['weaponStats'] != null
        ? WeaponStats.fromJson(json['weaponStats'])
        : null;
    shopData =
        json['shopData'] != null ? ShopData.fromJson(json['shopData']) : null;
    if (json['skins'] != null) {
      skins = <Skins>[];
      json['skins'].forEach((v) {
        skins!.add(Skins.fromJson(v));
      });
    }
  }
}

class WeaponStats {
  num? fireRate;
  num? magazineSize;
  num? runSpeedMultiplier;
  num? equipTimeSeconds;
  num? reloadTimeSeconds;
  num? firstBulletAccuracy;
  num? shotgunPelletCount;
  String? wallPenetration;
  String? fireMode;
  AdsStats? adsStats;
  List<DamageRanges>? damageRanges;

  WeaponStats(
      {this.fireRate,
      this.magazineSize,
      this.runSpeedMultiplier,
      this.equipTimeSeconds,
      this.reloadTimeSeconds,
      this.firstBulletAccuracy,
      this.shotgunPelletCount,
      this.wallPenetration,
      this.fireMode,
      this.adsStats,
      this.damageRanges});

  WeaponStats.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'];
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    equipTimeSeconds = json['equipTimeSeconds'];
    reloadTimeSeconds = json['reloadTimeSeconds'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
    shotgunPelletCount = json['shotgunPelletCount'];
    wallPenetration = json['wallPenetration'];
    fireMode = json['fireMode'];
    if (json['damageRanges'] != null) {
      damageRanges = <DamageRanges>[];
      json['damageRanges'].forEach((v) {
        damageRanges!.add(DamageRanges.fromJson(v));
      });
    }
  }
}

class AdsStats {
  num? fireRate;
  num? firstBulletAccuracy;

  AdsStats({this.fireRate, this.firstBulletAccuracy});

  AdsStats.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
  }
}

class DamageRanges {
  num? rangeStartMeters;
  num? rangeEndMeters;
  num? headDamage;
  num? bodyDamage;
  num? legDamage;

  DamageRanges(
      {this.rangeStartMeters,
      this.rangeEndMeters,
      this.headDamage,
      this.bodyDamage,
      this.legDamage});

  DamageRanges.fromJson(Map<String, dynamic> json) {
    rangeStartMeters = json['rangeStartMeters'];
    rangeEndMeters = json['rangeEndMeters'];
    headDamage = json['headDamage'];
    bodyDamage = json['bodyDamage'];
    legDamage = json['legDamage'];
  }
}

class ShopData {
  num? cost;
  String? category;
  String? categoryText;
  String? newImage;

  ShopData({
    this.cost,
    this.category,
    this.categoryText,
    this.newImage,
  });

  ShopData.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    category = json['category'];
    categoryText = json['categoryText'];
    newImage = json['newImage'];
  }
}

class Skins {
  String? uuid;
  String? displayName;
  String? displayIcon;
  String? wallpaper;

  Skins({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.wallpaper,
  });

  Skins.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    wallpaper = json['wallpaper'];
  }
}
