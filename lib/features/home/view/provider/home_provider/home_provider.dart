import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/core/data/models/favorite_model/favorite_model.dart';
import 'package:stellarlist/core/data/models/task_list_model/task_list_model.dart';
import 'package:stellarlist/core/data/models/task_model/task_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:stellarlist/core/domain/entities/section.dart';
import 'package:collection/collection.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';
import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/features/home/domain/usecases/home_feature_repo_usecase.dart';
import 'package:stellarlist/features/home/view/provider/favorites_stream_provider/favorites_stream_provider.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:uuid/uuid.dart';
import 'state_model/home_state_model.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class HomeProvider extends _$HomeProvider {
  late final StreamSubscription<List<Favorite>> _favoritesListener;

  //
  @override
  HomeStateModel build() {
    return HomeStateModel();
  }

  void initFavoritesStreamListener() {
    _favoritesListener =
        ref.watch<FavoritesStreamProvider>(favoritesStreamProviderProvider.notifier).build().listen(
              _addToFavorites,
            );
  }

  void disposeSubscriptions() {
    _favoritesListener.cancel();
  }

  void _addToFavorites(List<Favorite> favorites) {
    debugPrint("coming favorites");
    state = state.clone(favorites: favorites.map((favorite) => favorite as Favorite).toList());
  }

//

  void changeStartedToScrollTask(bool startedToScrollTask) {
    state = state.clone(startedToScrollTask: startedToScrollTask);
  }

  void addTaskList() {
    final favorite = Favorite(
      id: const Uuid().v4(),
      userId: ref.watch(registrationProviderProvider)?.user?.uid,
      section: null,
      taskList: TaskList(
        id: const Uuid().v4(),
        tasks: [],
        title: "New List",
      ),
    );
    state = state.clone(
      favorites: (state.favorites ?? <Favorite>[])..add(favorite),
    );
  }

  void addTaskForTaskListOnClick(Favorite favorite) async {
    // Find the favorite from the current state, exit early if not found
    FavoriteModel? favoriteWithTaskList = _findFavorite(favorite.id);

    if (favoriteWithTaskList == null) return;

    // Ensure the taskList exists, create one if null
    favoriteWithTaskList = _ensureTaskListExists(favoriteWithTaskList);

    if ((favoriteWithTaskList.taskList?.tasks?.isNotEmpty ?? false)) return;

    // Add the new task to the taskList
    final updatedTasks = List<TaskModel>.from(
      favoriteWithTaskList.taskList!.tasks ?? <TaskModel>[],
    )..add(
        TaskModel(id: const Uuid().v4(), title: "Title for task"),
      );

    // Update the favorite's task list
    favoriteWithTaskList = favoriteWithTaskList.copyWith(
      taskList: favoriteWithTaskList.taskList!.copyWith(
        tasks: updatedTasks,
      ),
    );

    // Update the state with the modified favorite
    _updateFavoriteInState(favoriteWithTaskList);

    // update server here
    // registrationProvider.user;
    await getIt.get<HomeFeatureRepoUseCase>().addFavorite(favoriteWithTaskList);
  }

  FavoriteModel? _findFavorite(String? id) {
    return FavoriteModel.fromEntity(
      state.favorites?.firstWhereOrNull((el) => el.id == id),
    );
  }

  FavoriteModel _ensureTaskListExists(FavoriteModel favorite) {
    return favorite.taskList != null
        ? favorite
        : favorite.copyWith(
            taskList: TaskListModel(
              id: const Uuid().v4(),
              tasks: [],
            ),
          );
  }

  void _updateFavoriteInState(FavoriteModel updatedFavorite) {
    // Update the favorites list with the modified favorite
    final updatedFavorites = List<Favorite>.from(state.favorites ?? []);
    final index = updatedFavorites.indexWhere((el) => el.id == updatedFavorite.id);
    if (index != -1) {
      updatedFavorites[index] = updatedFavorite;
    }

    // Update the state
    state = state.clone(
      favorites: updatedFavorites,
      selectedFavorite: updatedFavorite,
    );
  }

  void addSection() {
    final favorite = Favorite(
      id: const Uuid().v4(),
      userId: ref.watch(registrationProviderProvider)?.user?.uid,
      section: Section(
        id: const Uuid().v4(),
        taskLists: [],
      ),
      taskList: null,
    );
    state = state.clone(
      favorites: state.favorites?..add(favorite),
    );
  }

  void addCurrentIndex(int index) => state = state.clone(currentTaskIndex: index);

  void changeTaskListName(Favorite favorite, String value) async {
    var findFavorite = _findFavorite(favorite.id);

    if (findFavorite == null) return;

    findFavorite = findFavorite.copyWith(
      taskList: findFavorite.taskList!.copyWith(
        title: value,
      ),
    );

    _updateFavoriteInState(findFavorite);

    await getIt<HomeFeatureRepoUseCase>().updateFavorite(findFavorite);
  }
}
