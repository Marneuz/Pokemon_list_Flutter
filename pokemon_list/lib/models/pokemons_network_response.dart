class PokemonsNetworkResponse {
  int count;
  dynamic next;
  dynamic previous;
  List<PokemonNetworkListItem> results;

  PokemonsNetworkResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonsNetworkResponse.fromMap(Map<String, dynamic> json) =>
      PokemonsNetworkResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonNetworkListItem>.from(
            json["results"].map((x) => PokemonNetworkListItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class PokemonNetworkListItem {
  String name;
  String url;

  PokemonNetworkListItem({
    required this.name,
    required this.url,
  });

  factory PokemonNetworkListItem.fromMap(Map<String, dynamic> json) =>
      PokemonNetworkListItem(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
