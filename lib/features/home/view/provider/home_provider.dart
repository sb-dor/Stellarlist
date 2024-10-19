import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';
import 'package:stellarlist/core/domain/entities/section.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';

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
