import 'package:meta/meta.dart';
import 'package:pokemon/models/PokemonListModel.dart';

@immutable
class PostsStateHome {
  PokemonListModel? pokemonListModel;

  // final List<modelFavorites> posts;

  PostsStateHome({
    this.pokemonListModel,

    //this.posts,
  });

  factory PostsStateHome.initial() => PostsStateHome(
        pokemonListModel: null,
      );

  PostsStateHome copyWith({
    @required PokemonListModel? pokemonListModel,
  }) {
    return PostsStateHome(
      pokemonListModel: pokemonListModel ?? this.pokemonListModel,
    );
  }
}
