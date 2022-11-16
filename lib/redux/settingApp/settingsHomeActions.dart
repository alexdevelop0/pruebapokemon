import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pokemon/redux/common_actions.dart';
import 'package:pokemon/redux/settingApp/settingsHomeState.dart';

import 'package:redux/redux.dart';

class getInitialAppAction extends ErrorAction {
  getInitialAppAction(BuildContext context) : super(context);
}

class getListPokemonAction extends ErrorAction {
  getListPokemonAction(BuildContext context) : super(context);
}

@immutable
class SetPostsStateActionHome {
  final PostsStateHome postsState;

  SetPostsStateActionHome(this.postsState);
}
