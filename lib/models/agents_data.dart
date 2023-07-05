class AgentsData {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  String? assetPath;
  Role? role;
  List<Abilities>? abilities;

  AgentsData({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.assetPath,
    this.role,
    this.abilities,
  });

  factory AgentsData.fromJson(Map<String, dynamic> json) {
    return AgentsData(
      uuid: json["uuid"],
      displayName: json["displayName"],
      description: json["description"],
      developerName: json["developerName"],
      displayIcon: json["displayIcon"],
      displayIconSmall: json["displayIconSmall"],
      bustPortrait: json["bustPortrait"],
      fullPortrait: json["fullPortrait"],
      fullPortraitV2: json["fullPortraitV2"],
      killfeedPortrait: json["killfeedPortrait"],
      background: json["background"],
      assetPath: json["assetPath"],
      role: json["role"] != null ? Role.fromJson(json["role"]) : null,
      abilities: json["abilities"] == null ? [] : (json["abilities"] as List).map((e) => Abilities.fromJson(e)).toList(),
    );
  }
  Map<String, dynamic> toJSON() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "developerName": developerName,
        "displayIcon": displayIcon,
        "displayIconSmall": displayIconSmall,
        "bustPortrait": bustPortrait,
        "fullPortrait": fullPortrait,
        "fullPortraitV2": fullPortraitV2,
        "killfeedPortrait": killfeedPortrait,
        "background": background,
        "assetPath": assetPath,
        "role": role,
        "abilities": abilities?.map((e) => e.toJSON()).toList(),
      };
}

class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role({this.uuid, this.displayName, this.description, this.displayIcon, this.assetPath});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      uuid: json["uuid"],
      displayName: json["displayName"],
      description: json["description"],
      displayIcon: json["displayIcon"],
      assetPath: json["assetPath"],
    );
  }
  Map<String, dynamic> toJSON() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
      };
}

class Abilities {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({this.slot, this.displayName, this.description, this.displayIcon});

  factory Abilities.fromJson(Map<String, dynamic> json) {
    return Abilities(
      slot: json['slot'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
    );
  }

  Map<String, dynamic> toJSON() => {
        "slot": slot,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
      };
}
