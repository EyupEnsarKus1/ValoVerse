class AgentsData {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  Role? role;
  List<Abilities>? abilities;

  AgentsData({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.role,
    this.abilities,
  });

  factory AgentsData.fromJson(Map<String, dynamic> json) {
    return AgentsData(
      uuid: json["uuid"],
      displayName: json["displayName"],
      description: json["description"],
      displayIcon: json["displayIcon"],
      displayIconSmall: json["displayIconSmall"],
      bustPortrait: json["bustPortrait"],
      fullPortrait: json["fullPortrait"],
      fullPortraitV2: json["fullPortraitV2"],
      killfeedPortrait: json["killfeedPortrait"],
      background: json["background"],
      role: json["role"] != null ? Role.fromJson(json["role"]) : null,
      abilities: json["abilities"] == null
          ? []
          : (json["abilities"] as List)
              .map((e) => Abilities.fromJson(e))
              .toList(),
    );
  }
}

class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;

  Role({this.uuid, this.displayName, this.description, this.displayIcon});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      uuid: json["uuid"],
      displayName: json["displayName"],
      description: json["description"],
      displayIcon: json["displayIcon"],
    );
  }
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
}
