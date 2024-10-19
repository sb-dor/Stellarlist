import 'package:stellarlist/core/domain/entities/favorite.dart';

class HomeStateModel {
  bool startedToScrollTask;
  List<Favorite>? favorites;

  Favorite? selectedFavorite;

  //

  HomeStateModel({this.startedToScrollTask = false, this.favorites, this.selectedFavorite});

  HomeStateModel clone({
    bool? startedToScrollTask,
    List<Favorite>? favorites,
    Favorite? selectedFavorite,
  }) {
    return HomeStateModel(
      startedToScrollTask: startedToScrollTask ?? this.startedToScrollTask,
      favorites: favorites ?? this.favorites,
      selectedFavorite: selectedFavorite ?? this.selectedFavorite,
    );
  }
}
