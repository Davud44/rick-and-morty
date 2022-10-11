class CharacterResponse {
  CharacterResponse({
    required this.info,
    required this.characters,
  });

  late final Info info;
  late final List<Character> characters;

  CharacterResponse.fromJson(Map<String, dynamic> json) {
    info = Info.fromJson(json['info']);
    characters =
        List.from(json['results']).map((e) => Character.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['info'] = info.toJson();
    data['results'] = characters.map((e) => e.toJson()).toList();
    return data;
  }
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });

  late final int count;
  late final int pages;
  late final String next;
  late dynamic prev;

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    data['prev'] = prev;
    return data;
  }
}

class Character {
  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = Origin.fromJson(json['origin']);
    location = Location.fromJson(json['location']);
    image = json['image'];
    episode = List.castFrom<dynamic, String>(json['episode']);
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    data['origin'] = origin!.toJson();
    data['location'] = location!.toJson();
    data['image'] = image;
    data['episode'] = episode;
    data['url'] = url;
    data['created'] = created;
    return data;
  }
}

class Origin {
  Origin({
    required this.name,
    required this.url,
  });

  late final String name;
  late final String url;

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  late final String name;
  late final String url;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
