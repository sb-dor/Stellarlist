import 'package:stellarlist/core/data/models/section_model/section_model.dart';
import 'package:stellarlist/core/data/models/task_list_model/task_list_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';

class FavoriteModelFunctions extends Favorite {
  FavoriteModelFunctions({
    super.id,
    super.userId,
    SectionModel? super.section,
    TaskListModel? super.taskList,
  });

  static FavoriteModelFunctions? fromEntity(Favorite? favorite) {
    if (favorite == null) return null;
    return FavoriteModelFunctions(
      id: favorite.id,
      userId: favorite.userId,
      section: SectionModel.fromEntity(favorite.section),
      taskList: TaskListModel.fromEntity(favorite.taskList),
    );
  }

  String? title({bool getSectionTitle = false, bool getTaskListTitle = false}) {
    if (!getSectionTitle && !getTaskListTitle) {
      return section?.title ?? taskList?.title;
    }
    if (getSectionTitle) {
      return section?.title;
    }
    if (getTaskListTitle) {
      return taskList?.title;
    }
    return null;
  }
}
