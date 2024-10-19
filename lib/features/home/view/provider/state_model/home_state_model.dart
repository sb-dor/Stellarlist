import 'package:stellarlist/core/domain/entities/favorite.dart';

class HomeStateModel {
  bool startedToScrollTask;
  List<Favorite>? favorites;

  //

  HomeStateModel({
    this.startedToScrollTask = false,
    this.favorites,
  });

  HomeStateModel clone({
    bool? startedToScrollTask,
    List<Favorite>? favorites,
  }) {
    return HomeStateModel(
      startedToScrollTask: startedToScrollTask ?? this.startedToScrollTask,
      favorites: favorites ?? this.favorites,
    );
  }
}
