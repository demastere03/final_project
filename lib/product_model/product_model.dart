class AgentModel {
  int? status;
  List<Data>? data;

  AgentModel({
    this.status,
    this.data,
  });

  AgentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as int?;
    data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Data {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  dynamic characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  dynamic recruitmentData;
  List<Abilities>? abilities;
  dynamic voiceLine;

  Data({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.recruitmentData,
    this.abilities,
    this.voiceLine,
  });

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'] as String?;
    displayName = json['displayName'] as String?;
    description = json['description'] as String?;
    developerName = json['developerName'] as String?;
    characterTags = json['characterTags'];
    displayIcon = json['displayIcon'] as String?;
    displayIconSmall = json['displayIconSmall'] as String?;
    bustPortrait = json['bustPortrait'] as String?;
    fullPortrait = json['fullPortrait'] as String?;
    fullPortraitV2 = json['fullPortraitV2'] as String?;
    killfeedPortrait = json['killfeedPortrait'] as String?;
    background = json['background'] as String?;
    backgroundGradientColors = (json['backgroundGradientColors'] as List?)?.map((dynamic e) => e as String).toList();
    assetPath = json['assetPath'] as String?;
    isFullPortraitRightFacing = json['isFullPortraitRightFacing'] as bool?;
    isPlayableCharacter = json['isPlayableCharacter'] as bool?;
    isAvailableForTest = json['isAvailableForTest'] as bool?;
    isBaseContent = json['isBaseContent'] as bool?;
    role = (json['role'] as Map<String,dynamic>?) != null ? Role.fromJson(json['role'] as Map<String,dynamic>) : null;
    recruitmentData = json['recruitmentData'];
    abilities = (json['abilities'] as List?)?.map((dynamic e) => Abilities.fromJson(e as Map<String,dynamic>)).toList();
    voiceLine = json['voiceLine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['uuid'] = uuid;
    json['displayName'] = displayName;
    json['description'] = description;
    json['developerName'] = developerName;
    json['characterTags'] = characterTags;
    json['displayIcon'] = displayIcon;
    json['displayIconSmall'] = displayIconSmall;
    json['bustPortrait'] = bustPortrait;
    json['fullPortrait'] = fullPortrait;
    json['fullPortraitV2'] = fullPortraitV2;
    json['killfeedPortrait'] = killfeedPortrait;
    json['background'] = background;
    json['backgroundGradientColors'] = backgroundGradientColors;
    json['assetPath'] = assetPath;
    json['isFullPortraitRightFacing'] = isFullPortraitRightFacing;
    json['isPlayableCharacter'] = isPlayableCharacter;
    json['isAvailableForTest'] = isAvailableForTest;
    json['isBaseContent'] = isBaseContent;
    json['role'] = role?.toJson();
    json['recruitmentData'] = recruitmentData;
    json['abilities'] = abilities?.map((e) => e.toJson()).toList();
    json['voiceLine'] = voiceLine;
    return json;
  }
}

class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  Role.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'] as String?;
    displayName = json['displayName'] as String?;
    description = json['description'] as String?;
    displayIcon = json['displayIcon'] as String?;
    assetPath = json['assetPath'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['uuid'] = uuid;
    json['displayName'] = displayName;
    json['description'] = description;
    json['displayIcon'] = displayIcon;
    json['assetPath'] = assetPath;
    return json;
  }
}

class Abilities {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  Abilities.fromJson(Map<String, dynamic> json) {
    slot = json['slot'] as String?;
    displayName = json['displayName'] as String?;
    description = json['description'] as String?;
    displayIcon = json['displayIcon'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['slot'] = slot;
    json['displayName'] = displayName;
    json['description'] = description;
    json['displayIcon'] = displayIcon;
    return json;
  }
}