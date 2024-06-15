import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_list/constants/network_constants.dart';
import 'package:pokemon_list/models/pokemon_detail_network_response.dart';
import 'package:pokemon_list/repositories/pokemon_repository.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.name});

  final String name;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final PokemonRepository _pokemonRepository = PokemonRepository();
  PokemonDetailNetworkResponse? _pokemon;

  @override
  void initState() {
    super.initState();

    _getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(_pokemon?.name ?? 'N/A'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://i.pinimg.com/736x/8d/22/c6/8d22c6dfc034c114546b6c2f76e65770.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    if (_pokemon?.id != null)
                      CachedNetworkImage(
                          imageUrl: NetworkConstants.getPokemonImage(
                              _pokemon!.id - 1)),
                    Text(
                        "Types: ${_pokemon?.types.map((e) => e.type.name).join(", ")}"),
                    Text(
                        "Abilities: ${_pokemon?.abilities.map((e) => e.ability.name).join(", ")}"),
                    Text("Height: ${(_pokemon?.height ?? 0) / 10} mt"),
                    Text("Weight: ${(_pokemon?.weight ?? 0) / 10} kg"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getPokemon() async {
    _pokemon = await _pokemonRepository.getPokemon(widget.name);
    setState(() {});
  }
}
