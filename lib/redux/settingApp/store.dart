import 'package:pokemon/redux/settingApp/settingsHomeActions.dart';
import 'package:pokemon/redux/settingApp/settingsHomeReducer.dart';
import 'package:pokemon/redux/settingApp/settingsHomeState.dart';

import 'package:redux/redux.dart';

AppStateHome appReducerHome(AppStateHome state, dynamic action) {
  if (action is SetPostsStateActionHome) {
    final nextPostsState = postsReducerHome(state.postsState, action);

    return state.copyWith(postsState: nextPostsState);
  }

  return state;
}

class AppStateHome {
  final PostsStateHome postsState;

  AppStateHome({
    required this.postsState,
  });

  AppStateHome copyWith({
    PostsStateHome? postsState,
  }) {
    return AppStateHome(
      postsState: postsState ?? this.postsState,
    );
  }
}

class ReduxHome {
  static Store<AppStateHome> _store = _store;

  static Store<AppStateHome> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final postsStateInitial = PostsStateHome.initial();

    _store = Store<AppStateHome>(
      appReducerHome,
      middleware: [],
      initialState: AppStateHome(postsState: postsStateInitial),
    );
  }
}
