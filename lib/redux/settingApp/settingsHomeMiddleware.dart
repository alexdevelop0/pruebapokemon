import 'dart:async';

import 'package:pokemon/app/app_settings.dart';
import 'package:pokemon/data/api/api.dart';
import 'package:pokemon/models/PokemoDetailsModel.dart';
import 'package:pokemon/models/PokemonListModel.dart';
import 'package:pokemon/redux/app/app_state.dart';
import 'package:pokemon/redux/settingApp/settingsHomeState.dart';
import 'package:pokemon/redux/settingApp/store.dart';
import 'package:pokemon/utils/alert.dart';

import 'package:pokemon/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:pokemon/utils/widget.dart';
import 'package:redux/redux.dart';

import 'settingsHomeActions.dart';
import 'dart:async';

import 'package:intl/intl.dart';

import 'package:pokemon/redux/app/app_state.dart';
import 'package:pokemon/redux/settingApp/settingsHomeActions.dart';
import 'package:pokemon/redux/settingApp/settingsHomeState.dart';
import 'package:pokemon/redux/settingApp/store.dart';
import 'package:pokemon/redux/store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//import 'package:google_sign_in/google_sign_in.dart';

import 'dart:convert';
import 'dart:math';

import 'dart:math';
import 'dart:ui';

class settingHomeMiddleware extends MiddlewareClass<AppState> {
  settingHomeMiddleware(this.api);

  final API api;

  @override
  Future<void>? call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);

    Utils().functionCheckInternet(action.context).then((value) {
      if (value == true) {
        if (action is getListPokemonAction) {
          return _getListPokemon(next, action, store);
        }
        if (action is getDetailsPokemonAction) {
          return _getDetailsPokemon(next, action, store);
        }
      } else {
        AlertWidget().message(action.context, "No hay conexión");
      }
    });
  }
}

Future<void> _getDetailsPokemon(NextDispatcher next, getDetailsPokemonAction action, Store<AppState> store) async {
  AppWidget().showProgressGlobal(action.context);

  var response = await API().getDetailsPokemon(id: action.id);
  Navigator.pop(action.context);
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      PokemonDetailsModel data = pokemonDetailsModelFromJson(response.data);
      ReduxHome.store!.dispatch(
        SetPostsStateActionHome(PostsStateHome(pokemonDetailsModel: data)),
      );

      break;
    case AppSettings.statusCodeError:
      AlertWidget().message(action.context, response.message);

      break;
    default:
      AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getListPokemon(NextDispatcher next, getListPokemonAction action, Store<AppState> store) async {
  AppWidget().showProgressGlobal(action.context);

  var response = await API().getListPokemon();
  Navigator.pop(action.context);
  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      PokemonListModel data = pokemonListModelFromJson(response.data);
      ReduxHome.store!.dispatch(
        SetPostsStateActionHome(PostsStateHome(pokemonListModel: data)),
      );

      break;
    case AppSettings.statusCodeError:
      AlertWidget().message(action.context, response.message);

      break;
    default:
      AlertWidget().message(action.context, response.message);
  }
}
