import 'package:pokemon/redux/settingApp/settingsHomeActions.dart';
import 'package:pokemon/redux/settingApp/settingsHomeState.dart';

postsReducerHome(PostsStateHome? prevState, SetPostsStateActionHome action) {
  final payload = action.postsState;
  return prevState?.copyWith(
    pokemonListModel: payload.pokemonListModel,

    // posts: payload.posts,
  );
}
