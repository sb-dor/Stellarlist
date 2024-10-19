import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/core/data/models/favorite_model/favorite_model.dart';
import 'package:stellarlist/core/data/models/task_list_model/task_list_model.dart';
import 'package:stellarlist/core/data/models/task_model/task_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:stellarlist/core/domain/entities/section.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';
import 'package:collection/collection.dart';
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
    final favorite = Favorite(
      section: null,
      taskList: TaskList(),
    );
    state = state.clone(
      favorites: (state.favorites ?? [])..add(favorite),
    );
  }

  void addTaskForTaskListOnClick(Favorite taskList) {
    final task = TaskModel();
    FavoriteModel? findFavoriteWithTaskList = FavoriteModel.fromEntity(
      state.favorites?.firstWhereOrNull(
        (el) => el.taskList?.id == taskList.taskList?.id,
      ),
    );
    if (findFavoriteWithTaskList == null) return;
    if (findFavoriteWithTaskList.taskList == null) {
      findFavoriteWithTaskList = findFavoriteWithTaskList.copyWith(
        taskList: TaskListModel(tasks: []),
      );
    }
    findFavoriteWithTaskList = findFavoriteWithTaskList.copyWith(
      taskList: findFavoriteWithTaskList.taskList?.copyWith(
        tasks: findFavoriteWithTaskList.taskList?.tasks?..add(task),
      ),
    );

    var list = state.favorites;

    list?[list.indexWhere((el) => el.taskList?.id == findFavoriteWithTaskList?.taskList?.id)] =
        findFavoriteWithTaskList;

    state = state.clone(favorites: list);
  }

  void addSection() {
    final favorite = Favorite(
      section: Section(),
      taskList: null,
    );
    state = state.clone(
      favorites: state.favorites?..add(favorite),
    );
  }
}
