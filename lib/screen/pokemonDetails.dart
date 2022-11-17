import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokemon/models/PokemoDetailsModel.dart';
import 'package:pokemon/models/PokemonListModel.dart';
import 'package:pokemon/redux/settingApp/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pokemon/data/api/api.dart';
import 'package:pokemon/models/PokemonListModel.dart';
import 'package:pokemon/redux/settingApp/settingsHomeActions.dart';
import 'package:pokemon/redux/settingApp/store.dart';
import 'package:pokemon/screen/pokemonDetails.dart';
import 'package:pokemon/style/style.dart';
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
  var _store;
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppStateHome>(
        //ReduxSignUp.store,
        store: ReduxHome.store,
        child: StoreConnector<AppStateHome, dynamic>(
            //distinct: false,
            converter: (store) => store.state.postsState,
            onInit: (store) {
              _store = store;
            },
            builder: (context, value) {
              return Scaffold(
                body: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  // Center is a layout widget. It takes a single child and positions it
                  // in the middle of the parent.
                  child: ReduxHome.store!.state.postsState!.pokemonDetailsModel == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                              ],
                            )
                          ],
                        )
                      : ListView(
                          children: <Widget>[
                            Text(
                              ReduxHome.store!.state.postsState!.pokemonDetailsModel!.name.toString(),
                              style: AppStyle().styleTextGeneralTitle.copyWith(fontSize: 40),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Alto: " + ReduxHome.store!.state.postsState!.pokemonDetailsModel!.height.toString(),
                              style: AppStyle().styleTextGeneralTitle,
                            ),
                            Text(
                              "Ancho: " + ReduxHome.store!.state.postsState!.pokemonDetailsModel!.weight.toString(),
                              style: AppStyle().styleTextGeneralTitle,
                            ),
                            Text(
                              "Id: " + ReduxHome.store!.state.postsState!.pokemonDetailsModel!.id.toString(),
                              style: AppStyle().styleTextGeneralTitle,
                            ),
                            Text(
                              "Order: " + ReduxHome.store!.state.postsState!.pokemonDetailsModel!.order.toString(),
                              style: AppStyle().styleTextGeneralTitle,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Formulario",
                              style: AppStyle().styleTextGeneralTitle,
                            ),
                            ReduxHome.store!.state.postsState!.pokemonDetailsModel == null
                                ? Text("No hay resultados")
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: ReduxHome.store!.state.postsState!.pokemonDetailsModel!.forms!.length,
                                    itemBuilder: ((context, index) {
                                      Species data = ReduxHome.store!.state.postsState!.pokemonDetailsModel!.forms![index];
                                      return ListTile(
                                        title: Text(data.name.toString()),
                                      );
                                    })),
                            Text(
                              "Habilidad",
                              style: AppStyle().styleTextGeneralTitle,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: ReduxHome.store!.state.postsState!.pokemonDetailsModel!.abilities!.length,
                                itemBuilder: ((context, index) {
                                  Ability data = ReduxHome.store!.state.postsState!.pokemonDetailsModel!.abilities![index];
                                  return ListTile(
                                    title: Text(data.ability!.name.toString()),
                                  );
                                })),
                            Text(
                              "Game Index",
                              style: AppStyle().styleTextGeneralTitle,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: ReduxHome.store!.state.postsState!.pokemonDetailsModel!.gameIndices!.length,
                                itemBuilder: ((context, index) {
                                  GameIndex data = ReduxHome.store!.state.postsState!.pokemonDetailsModel!.gameIndices![index];
                                  return ListTile(
                                    title: Text(data.gameIndex.toString()),
                                  );
                                })),
                          ],
                        ),
                ),
              );
            }));
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
