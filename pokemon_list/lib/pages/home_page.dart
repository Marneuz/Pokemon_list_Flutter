import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_list/models/pokemons_network_response.dart';
import 'package:pokemon_list/repositories/pokemon_repository.dart';
import 'package:pokemon_list/widgets/pokemon_list_row.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonRepository _pokemonRepository = PokemonRepository();
  final PagingController<int, PokemonNetworkListItem> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _getPokemons(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokémon"),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            _pagingController.refresh();
          },
          child: Scrollbar(
            child: PagedListView.separated(
              pagingController: _pagingController,
              builderDelegate:
                  PagedChildBuilderDelegate<PokemonNetworkListItem>(
                      itemBuilder: (context, item, index) {
                return PokemonListRow(
                    pokemonNetworkListItem: item, listIndex: index);
              }),
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await canLaunchUrl(Uri.parse("https://www.pokemon.com"))) {
            launchUrl(Uri.parse("https://www.pokemon.com"),
                mode: LaunchMode.externalApplication);
          } else {
            if (!mounted) return;

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("No tienes ningún navegador instalado.")));
          }
        },
        child: const Icon(Icons.web),
      ),
    );
  }

  _getPokemons(int offset) async {
    if (offset == 0) {
      _pagingController.itemList?.clear();
    }

    final pokemonResponse = await _pokemonRepository.getPokemons(offset);
    final end = _pagingController.itemList?.length == pokemonResponse.count;

    if (end) {
      _pagingController.appendLastPage([]);
      return;
    }

    _pagingController.appendPage(
        pokemonResponse.results, offset + pokemonResponse.results.length);

    setState(() {});
  }
}
