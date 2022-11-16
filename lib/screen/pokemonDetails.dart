import 'package:flutter/material.dart';
import 'package:pokemon/models/PokemonListModel.dart';
import 'package:pokemon/redux/settingApp/store.dart';

class PokemonDetailsPage extends StatefulWidget {
  PokemonDetailsPage({super.key});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReduxHome.store.state.postsState!.pokemonListModel == null
                ? Text("No hay resultados")
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: ReduxHome.store.state.postsState!.pokemonListModel!.results!.length,
                    itemBuilder: ((context, index) {
                      Result data = ReduxHome.store.state.postsState!.pokemonListModel!.results![index];
                      return ListTile(
                        title: Text(data.name.toString()),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
