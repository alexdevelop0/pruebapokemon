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

Future<void> main() async {
  await ReduxHome.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Pokemon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var _store;

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
                appBar: AppBar(
                  elevation: 0,
                  // Here we take the value from the MyHomePage object that was created by
                  // the App.build method, and use it to set our appbar title.
                  title: Text(widget.title),
                ),
                body: Center(
                  // Center is a layout widget. It takes a single child and positions it
                  // in the middle of the parent.
                  child: ListView(
                    children: <Widget>[
                      ReduxHome.store!.state.postsState!.pokemonListModel == null
                          ? Text("No hay resultados")
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: ReduxHome.store!.state.postsState!.pokemonListModel!.results!.length,
                              itemBuilder: ((context, index) {
                                Result data = ReduxHome.store!.state.postsState!.pokemonListModel!.results![index];
                                return Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: ListTile(
                                      title: Text(data.name.toString()),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PokemonDetailsPage(
                                                    url: data.url.toString(),
                                                  )),
                                        );
                                      },
                                      leading: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ));
                              }))
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

      store.dispatch(getListPokemonAction(context));
    }

    async();
  }
}
