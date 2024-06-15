// ignore_for_file: constant_identifier_names

class NetworkConstants {
  static const String BASE_URL = "https://pokeapi.co/api/v2";

  static const String POKEMONS_PATH = "$BASE_URL/pokemon";

  static String getPokemonImage(int index) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png";
  }
}
