import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:stellarlist/features/home/view/provider/home_provider/state_model/selected_task_list.dart';

class HomeStateModel {
  bool startedToScrollTask;
  List<Favorite>? favorites;
  int currentTaskIndex;

  Favorite? selectedFavorite;
  SelectedTaskList? selectedTaskList;

  //

  HomeStateModel({
    this.startedToScrollTask = false,
    this.favorites,
    this.selectedFavorite,
    this.currentTaskIndex = 0,
    this.selectedTaskList,
  });

  HomeStateModel clone({
    bool? startedToScrollTask,
    List<Favorite>? favorites,
    Favorite? selectedFavorite,
    int? currentTaskIndex,
    SelectedTaskList? selectedTaskList,
  }) {
    return HomeStateModel(
      startedToScrollTask: startedToScrollTask ?? this.startedToScrollTask,
      favorites: favorites ?? this.favorites,
      selectedFavorite: selectedFavorite ?? this.selectedFavorite,
      currentTaskIndex: currentTaskIndex ?? this.currentTaskIndex,
      selectedTaskList: selectedTaskList ?? this.selectedTaskList,
    );
  }
}
