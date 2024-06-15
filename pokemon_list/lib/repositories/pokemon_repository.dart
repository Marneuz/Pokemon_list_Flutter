import 'package:dio/dio.dart';
import 'package:pokemon_list/constants/network_constants.dart';
import 'package:pokemon_list/models/pokemon_detail_network_response.dart';
import 'package:pokemon_list/models/pokemons_network_response.dart';

class PokemonRepository {
  final _dio = Dio();

  Future<PokemonsNetworkResponse> getPokemons(int offset) async {
    final response = await _dio.get(NetworkConstants.POKEMONS_PATH,
        queryParameters: {'offset': offset, 'limit': 20});
    final pokemonResponse = PokemonsNetworkResponse.fromMap(response.data);

    return pokemonResponse;
  }

  Future<PokemonDetailNetworkResponse> getPokemon(String name) async {
    final response = await _dio.get('${NetworkConstants.POKEMONS_PATH}/$name');
    final pokemonResponse = PokemonDetailNetworkResponse.fromMap(response.data);

    return pokemonResponse;
  }
}
