import 'package:meta/meta.dart';
import 'package:pokemon/models/PokemoDetailsModel.dart';
import 'package:pokemon/models/PokemonListModel.dart';

@immutable
class PostsStateHome {
  PokemonListModel? pokemonListModel;
  PokemonDetailsModel? pokemonDetailsModel;

  // final List<modelFavorites> posts;

  PostsStateHome({
    this.pokemonListModel,
    this.pokemonDetailsModel,

    //this.posts,
  });

  factory PostsStateHome.initial() => PostsStateHome(
        pokemonListModel: null,
        pokemonDetailsModel: null,
      );

  PostsStateHome copyWith({
    @required PokemonListModel? pokemonListModel,
    @required PokemonDetailsModel? pokemonDetailsModel,
  }) {
    return PostsStateHome(
      pokemonListModel: pokemonListModel ?? this.pokemonListModel,
      pokemonDetailsModel: pokemonDetailsModel ?? this.pokemonDetailsModel,
    );
  }
}
