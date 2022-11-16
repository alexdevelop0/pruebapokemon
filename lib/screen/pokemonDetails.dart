import 'package:flutter/material.dart';
import 'package:pokemon/models/PokemonListModel.dart';
import 'package:pokemon/redux/settingApp/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pokemon/data/api/api.dart';
import 'package:pokemon/models/PokemonListModel.dart';
import 'package:pokemon/redux/settingApp/settingsHomeActions.dart';
import 'package:pokemon/redux/settingApp/store.dart';
import 'package:pokemon/screen/pokemonDetails.dart';
import 'package:redux/redux.dart';

import '../../redux/app/app_state.dart';
import '../../redux/store.dart';

class PokemonDetailsPage extends StatefulWidget {
  // Requiring the list of todos.
  PokemonDetailsPage({super.key, required this.url});

  final String url;

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
            ReduxHome.store!.state.postsState!.pokemonDetailsModel == null
                ? Text("No hay resultados")
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: ReduxHome.store!.state.postsState!.pokemonListModel!.results!.length,
                    itemBuilder: ((context, index) {
                      Result data = ReduxHome.store!.state.postsState!.pokemonListModel!.results![index];
                      return ListTile(
                        title: Text(data.name.toString()),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    async() async {
      Store<AppState> store = await createStore(api: API());

      store.dispatch(getDetailsPokemonAction(context, widget.url));
    }

    async();
  }
}
