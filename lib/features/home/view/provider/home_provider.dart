import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/core/data/models/favorite_model/favorite_model.dart';
import 'package:stellarlist/core/data/models/task_list_model/task_list_model.dart';
import 'package:stellarlist/core/data/models/task_model/task_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:stellarlist/core/domain/entities/section.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';
import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';
import 'state_model/home_state_model.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class HomeProvider extends _$HomeProvider {
  //
  @override
  HomeStateModel build() {
    return HomeStateModel();
  }

//

  void changeStartedToScrollTask(bool startedToScrollTask) {
    state = state.clone(startedToScrollTask: startedToScrollTask);
  }

  void addTaskList() {
    final favorite = FavoriteModel(
      id: const Uuid().v4(),
      section: null,
      taskList: TaskListModel(
        id: const Uuid().v4(),
        tasks: [],
        title: "New List",
      ),
    );
    state = state.clone(
      favorites: (state.favorites ?? <Favorite>[])..add(favorite),
    );
  }

  void addTaskForTaskListOnClick(Favorite favorite) {
    final task = TaskModel(); // Create the new task

    FavoriteModel? findFavoriteWithTaskList = FavoriteModel.fromEntity(
      state.favorites?.firstWhereOrNull(
        (el) => el.id == favorite.id,
      ),
    );

    // If no favorite was found, exit
    if (findFavoriteWithTaskList == null) return;

    // If the taskList is null, create a new TaskListModel
    if (findFavoriteWithTaskList.taskList == null) {
      findFavoriteWithTaskList = findFavoriteWithTaskList.copyWith(
        taskList: TaskListModel(
          id: const Uuid().v4(),
          tasks: [],
        ),
      );
    }

    // Print the current tasks for debugging
    debugPrint("Tasks before update: ${findFavoriteWithTaskList.taskList?.tasks}");

    // Create a new mutable list from the existing tasks
    final updatedTasks = List<TaskModel>.from(findFavoriteWithTaskList.taskList?.tasks ?? [])
      ..add(task); // Add the new task to the list

    // Update the taskList with the new list of tasks
    findFavoriteWithTaskList = findFavoriteWithTaskList.copyWith(
      taskList: findFavoriteWithTaskList.taskList?.copyWith(
        tasks: updatedTasks,
      ),
    );

    // Print the updated tasks for debugging
    debugPrint("Tasks after update: ${findFavoriteWithTaskList.taskList?.tasks}");

    // Update the favorites list in the state
    var list = state.favorites ?? <Favorite>[];

    // Replace the modified favorite in the list
    list[list.indexWhere((el) => el.id == findFavoriteWithTaskList?.id)] = findFavoriteWithTaskList;

    // Update the state with the modified favorites list and the selected favorite
    state = state.clone(
      favorites: list,
      selectedFavorite: findFavoriteWithTaskList,
    );
  }

  void addSection() {
    final favorite = Favorite(
      id: const Uuid().v4(),
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
}
