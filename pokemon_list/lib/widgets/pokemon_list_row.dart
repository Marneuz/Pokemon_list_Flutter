import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_list/constants/network_constants.dart';
import 'package:pokemon_list/models/pokemons_network_response.dart';
import 'package:pokemon_list/navigation/navigation_routes.dart';

class PokemonListRow extends StatelessWidget {
  const PokemonListRow(
      {super.key,
      required this.pokemonNetworkListItem,
      required this.listIndex});

  final PokemonNetworkListItem pokemonNetworkListItem;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(NavigationRoutes.DETAIL, extra: pokemonNetworkListItem.name);
      },
      child: Row(
        children: [
          CachedNetworkImage(
              imageUrl: NetworkConstants.getPokemonImage(listIndex),
              width: 80,
              height: 80,
              fit: BoxFit.cover),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              pokemonNetworkListItem.name,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
