class PokemonDetailNetworkResponse {
  List<PokemonNetworkAbility> abilities;
  int height;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  String name;
  int order;
  List<PokemonNetworkType> types;
  int weight;

  PokemonDetailNetworkResponse({
    required this.abilities,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.name,
    required this.order,
    required this.types,
    required this.weight,
  });

  factory PokemonDetailNetworkResponse.fromMap(Map<String, dynamic> json) =>
      PokemonDetailNetworkResponse(
        abilities: List<PokemonNetworkAbility>.from(
            json["abilities"].map((x) => PokemonNetworkAbility.fromMap(x))),
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        name: json["name"],
        order: json["order"],
        types: List<PokemonNetworkType>.from(
            json["types"].map((x) => PokemonNetworkType.fromMap(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toMap())),
        "height": height,
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "name": name,
        "order": order,
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "weight": weight,
      };
}

class PokemonNetworkAbility {
  PokemonNetworkSpecies ability;
  bool isHidden;
  int slot;

  PokemonNetworkAbility({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonNetworkAbility.fromMap(Map<String, dynamic> json) =>
      PokemonNetworkAbility(
        ability: PokemonNetworkSpecies.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toMap() => {
        "ability": ability.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class PokemonNetworkSpecies {
  String name;
  String url;

  PokemonNetworkSpecies({
    required this.name,
    required this.url,
  });

  factory PokemonNetworkSpecies.fromMap(Map<String, dynamic> json) =>
      PokemonNetworkSpecies(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class PokemonNetworkType {
  int slot;
  PokemonNetworkSpecies type;

  PokemonNetworkType({
    required this.slot,
    required this.type,
  });

  factory PokemonNetworkType.fromMap(Map<String, dynamic> json) =>
      PokemonNetworkType(
        slot: json["slot"],
        type: PokemonNetworkSpecies.fromMap(json["type"]),
      );

  Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type.toMap(),
      };
}
