import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/core/data/models/favorite_model/favorite_model.dart';
import 'package:stellarlist/core/data/models/task_list_model/task_list_model.dart';
import 'package:stellarlist/core/data/models/task_model/task_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:stellarlist/core/domain/entities/section.dart';
import 'package:collection/collection.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';
import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/features/home/domain/usecases/home_feature_repo_usecase.dart';
import 'package:stellarlist/features/home/view/provider/favorites_stream_provider/favorites_stream_provider.dart';
import 'package:stellarlist/features/home/view/provider/home_provider/state_model/selected_task_list.dart';
import 'package:stellarlist/features/registration/view/provider/registration_provider.dart';
import 'package:uuid/uuid.dart';
import 'state_model/home_state_model.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class HomeProvider extends _$HomeProvider {
  StreamSubscription<List<Favorite>>? _favoritesListener;

  //
  @override
  HomeStateModel build() {
    return HomeStateModel();
  }

  void initFavoritesStreamListener() {
    debugPrint("favorites subs initing");
    _favoritesListener =
        ref.watch<FavoritesStreamProvider>(favoritesStreamProviderProvider.notifier).build().listen(
              _addToFavorites,
            );
  }

  void disposeSubscriptions() {
    debugPrint("favorites subs disposing");
    _favoritesListener?.cancel();
  }

  void _addToFavorites(List<Favorite> favorites) {
    state = state.clone(favorites: favorites);
  }

//

  void changeStartedToScrollTask(bool startedToScrollTask) {
    state = state.clone(startedToScrollTask: startedToScrollTask);
  }

  TaskModel _newTask() => TaskModel(
        id: const Uuid().v4(),
        title: "Title for task",
        subtasks: [],
      );

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

    if ((favoriteWithTaskList.taskList?.tasks?.isNotEmpty ?? false)) {
      state = state.clone(
        selectedTaskList: SelectedTaskList(),
      );
      // await Future.delayed(const Duration(milliseconds: 150));
      state = state.clone(
        selectedTaskList: SelectedTaskList(
          taskList: favoriteWithTaskList.taskList,
          // keep the list empty on first click
          // tasks: favoriteWithTaskList.taskList?.tasks,
        ),
      );
      return;
    }

    // Add the new task to the taskList
    final updatedTasks = List<TaskModel>.from(
      favoriteWithTaskList.taskList!.tasks ?? <TaskModel>[],
    )..add(
        _newTask(),
      );

    // Update the favorite's task list
    favoriteWithTaskList = favoriteWithTaskList.copyWith.taskList!(
      tasks: updatedTasks,
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
      selectedTaskList: SelectedTaskList(
        taskList: updatedFavorite.taskList,
        // keep the list empty on first click
        // tasks: updatedFavorite.taskList?.tasks,
      ),
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

    // findFavorite = findFavorite.copyWith(
    //   taskList: findFavorite.taskList!.copyWith(
    //     title: value,
    //   ),
    // );

    findFavorite = findFavorite.copyWith.taskList!(
      title: value,
    );

    _updateFavoriteInState(findFavorite);

    await getIt<HomeFeatureRepoUseCase>().updateFavorite(findFavorite);
  }

  Favorite? findFavoriteByTaskList(TaskList? taskList) {
    return state.favorites?.firstWhereOrNull((favorite) => favorite.taskList?.id == taskList?.id);
  }

  Favorite? findFavoriteByTask(Task? task) {
    return state.favorites?.firstWhereOrNull((favorite) {
      return (favorite.taskList?.tasks
              ?.any((favoritesTaskListTask) => favoritesTaskListTask.id == task?.id) ??
          false);
    });
  }

  Favorite? findFavoriteBySubtask(Task? task) {
    bool found(Task? mainTask, Task? targetTask) {
      if (mainTask?.id == targetTask?.id) return true;

      for (final subtask in mainTask?.subtasks ?? <Task>[]) {
        if (found(subtask, targetTask)) return true;
      }

      return false;
    }

    return state.favorites?.firstWhereOrNull((favorite) {
      return favorite.taskList?.tasks?.any((mainTask) => found(mainTask, task)) ?? false;
    });
  }

  TaskList? findTaskListByTask(Task? task) {
    return state.favorites?.firstWhereOrNull((favorite) {
      return favorite.taskList?.tasks?.any((taskInList) => taskInList.id == task?.id) ?? false;
    })?.taskList;
  }

  // function that changes task title inside favorite's task list
  Future<void> changeTaskNameOfTaskList(Task? task, String? value) async {
    var favorite = FavoriteModel.fromEntity(findFavoriteBySubtask(task));

    debugPrint("favorite name is: ${favorite?.taskList?.title}");

    if (favorite == null) return;

    final clonedState = state.clone();

    var taskModel = TaskModel.fromEntity(task);

    taskModel = taskModel?.copyWith(title: value);

    _updateSelectedTask(
      clonedState,
      taskModel,
    );

    favorite = favorite.copyWith(
      taskList: TaskListModel.fromEntity(clonedState.selectedTaskList?.taskList),
    );

    // TODO: you have to update favorite here

    // var listOfTasks = List<TaskModel>.from(
    //   clonedState.selectedTaskList?.taskList?.tasks ?? <TaskModel>[],
    // );
    //
    // final findTaskIndex = listOfTasks.indexWhere((taskInList) => taskInList.id == task?.id);
    //
    // if (findTaskIndex != -1 && taskModel != null) {
    //   // when you changed favorite data
    //   listOfTasks[findTaskIndex] = taskModel.copyWith(title: value);
    //
    //   favorite = favorite.copyWith.taskList!(
    //     tasks: listOfTasks,
    //   );
    // }
    // // the list from selected tasks, not selected taskList's task
    // var listSelectedTasks = List<TaskModel>.from(
    //   clonedState.selectedTaskList?.tasks ?? <TaskModel>[],
    // );
    //
    // final findTaskIndexSelectedTask = listSelectedTasks.indexWhere(
    //   (taskInList) => taskInList.id == task?.id,
    // );
    //
    // if (findTaskIndexSelectedTask != -1 && taskModel != null) {
    //   listSelectedTasks[findTaskIndexSelectedTask] = taskModel.copyWith(title: value);
    // }
    //
    // final taskListFromEntity = TaskListModel.fromEntity(
    //   clonedState.selectedTaskList?.taskList,
    // );
    //
    // // Update selectedTaskList in a new cloned state
    // final clonedSelectedTaskList = clonedState.selectedTaskList?.copyWith(
    //   taskList: taskListFromEntity?.copyWith(tasks: listOfTasks),
    //   tasks: listSelectedTasks,
    // );
    //
    // // Set updated selectedTaskList with cloned task list and tasks
    // clonedState.selectedTaskList = SelectedTaskList(
    //   taskList: clonedSelectedTaskList?.taskList,
    //   tasks: clonedSelectedTaskList?.tasks,
    // );

    state = clonedState;

    await getIt<HomeFeatureRepoUseCase>().updateFavorite(favorite);
  }

  // function that added task inside task list of favorite
  void addTaskInsideTaskList(Task? task, String value) async {
    var favorite = FavoriteModel.fromEntity(findFavoriteByTask(task));

    if (favorite == null) return;

    final newTask = _newTask();

    final tasks = List<TaskModel>.from(favorite.taskList?.tasks ?? <TaskModel>[]);

    tasks.add(
      newTask.copyWith(
        title: value,
        id: const Uuid().v4(),
      ),
    );

    // update favorite
    favorite = favorite.copyWith.taskList!(
      tasks: tasks,
    );

    final taskListModel = state.selectedTaskList?.copyWith(
      taskList: TaskListModel.fromEntity(state.selectedTaskList?.taskList)?.copyWith(
        tasks: tasks,
      ),
    );

    // update selected_task_list
    state = state.clone(
      selectedTaskList: taskListModel,
    );

    await getIt<HomeFeatureRepoUseCase>().updateFavorite(favorite);
  }

  //
  Future<void> deleteTaskFromTaskList(Task? task) async {
    // Find and check if favorite exists
    var favorite = FavoriteModel.fromEntity(findFavoriteByTask(task));

    if (favorite == null) return;

    // Get a cloned list of tasks and remove the specified task
    final tasks = List<TaskModel>.from(
      state.selectedTaskList?.taskList?.tasks ?? <TaskModel>[],
    ).toList();

    tasks.removeWhere((taskInList) => taskInList.id == task?.id);

    // Update favorite's task list with new tasks
    favorite = favorite.copyWith(
      taskList: favorite.taskList!.copyWith(tasks: tasks),
    );

    // Create a cloned task list from entity
    final taskListFromEntity = TaskListModel.fromEntity(
      state.selectedTaskList?.taskList,
    );

    // Update selectedTaskList in a new cloned state
    final clonedSelectedTaskList = state.selectedTaskList?.copyWith(
      taskList: taskListFromEntity?.copyWith(tasks: tasks),
    );

    // Set updated selectedTaskList with cloned task list and tasks
    state = state.clone(
      selectedTaskList: SelectedTaskList(
        taskList: clonedSelectedTaskList?.taskList,
        tasks: clonedSelectedTaskList?.tasks,
      ),
    );

    // Perform any final operations, like updating favorite
    await getIt<HomeFeatureRepoUseCase>().updateFavorite(favorite);
  }

  void addTaskForSelectedTaskList(Task? task, {bool mainTask = true}) {
    if (task == null) return;
    final tempState = state.clone();
    if (mainTask) {
      tempState.selectedTaskList?.tasks?.clear();
    }
    tempState.selectedTaskList?.tasks ??= <Task>[];
    tempState.selectedTaskList?.tasks?.add(task);
    state = tempState;
  }

  void removeTaskFromSelectedTaskList(Task? task) {
    final tempState = state.clone();
    tempState.selectedTaskList?.tasks?.removeWhere((taskInList) => taskInList.id == task?.id);
    state = tempState;
  }

  //
  void addTaskInsideSubTaskOfSpecificTask(Task? mainTask) {
    final favorite = findFavoriteBySubtask(mainTask);

    if (favorite == null) return;

    var taskModel = TaskModel.fromEntity(mainTask);

    var clonedState = state.clone();

    final listSubtaskFromTask = List<TaskModel>.from(taskModel?.subtasks ?? <TaskModel>[]);

    listSubtaskFromTask.add(_newTask());

    taskModel = taskModel?.copyWith(
      subtasks: listSubtaskFromTask,
    );

    _updateSelectedTask(
      clonedState,
      taskModel,
    );

    state = clonedState;

    //
    // for (final task in clonedSelectedTasks) {
    //   _recurseSearchInSideTaskList(
    //     TaskModel.fromEntity(task),
    //     taskModel,
    //   );
    // }
    //
    // clonedState = clonedState.clone(
    //   selectedTaskList: clonedState.selectedTaskList?.copyWith(
    //     taskList: TaskListModel.fromEntity(clonedState.selectedTaskList?.taskList)?.copyWith(
    //       tasks: clonedTaskListTasks.map((e) => TaskModel.fromEntity(e)!).toList(),
    //     ),
    //     tasks: clonedSelectedTasks,
    //   ),
    // );
    //
    // for (final each in clonedState.selectedTaskList?.tasks ?? <TaskModel>[]) {}
  }

  void _updateSelectedTask(
    HomeStateModel clonedState,
    TaskModel? taskModel,
  ) {
    final updatedTasks = _updateTaskInList(
      List<Task>.from(clonedState.selectedTaskList?.taskList?.tasks ?? <Task>[]),
      taskModel,
    );

    final updatedSelectedTasks = _updateTaskInList(
      List<Task>.from(clonedState.selectedTaskList?.tasks ?? <Task>[]),
      taskModel,
    );

    final selectedTask = clonedState.selectedTaskList?.copyWith(
      taskList: TaskListModel.fromEntity(clonedState.selectedTaskList?.taskList)?.copyWith(
        tasks: updatedTasks.map((e) => e!).toList(),
      ),
      tasks: updatedSelectedTasks.map((e) => e!).toList(),
    );

    clonedState.selectedTaskList = selectedTask;
  }

  List<TaskModel?> _updateTaskInList(List<Task> tasks, TaskModel? taskForChange) {
    return tasks.map((task) {
      // If the task matches the taskForChange, update it with the new subtasks
      if (task.id == taskForChange?.id) {
        return TaskModel.fromEntity(task)?.copyWith(
          title: taskForChange?.title,
          subtasks: taskForChange?.subtasks,
        );
      } else {
        // Otherwise, recursively update its subtasks
        return TaskModel.fromEntity(task)?.copyWith(
          subtasks: _updateTaskInList(task.subtasks ?? [], taskForChange).map((e) => e!).toList(),
        );
      }
    }).toList();
  }
}
