import 'package:stellarlist/core/domain/entities/favorite.dart';

class HomeStateModel {
  bool startedToScrollTask;
  List<Favorite>? favorites;
  int currentTaskIndex;

  Favorite? selectedFavorite;

  //

  HomeStateModel({
    this.startedToScrollTask = false,
    this.favorites,
    this.selectedFavorite,
    this.currentTaskIndex = 0,
  });

  HomeStateModel clone({
    bool? startedToScrollTask,
    List<Favorite>? favorites,
    Favorite? selectedFavorite,
    int? currentTaskIndex,
  }) {
    return HomeStateModel(
      startedToScrollTask: startedToScrollTask ?? this.startedToScrollTask,
      favorites: favorites ?? this.favorites,
      selectedFavorite: selectedFavorite ?? this.selectedFavorite,
      currentTaskIndex: currentTaskIndex ?? this.currentTaskIndex,
    );
  }
}
