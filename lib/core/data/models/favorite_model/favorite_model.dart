import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/data/models/section_model/section_model.dart';
import 'package:stellarlist/core/data/models/task_list_model/task_list_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';

part 'favorite_model.g.dart';

part 'favorite_model.freezed.dart';

@freezed
class FavoriteModel extends Favorite with _$FavoriteModel {
  factory FavoriteModel({
    String? id,
    @JsonKey(name: "user_id") String? userId,
    SectionModel? section,
    @JsonKey(name: "task_list") TaskListModel? taskList,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, Object?> json) => _$FavoriteModelFromJson(json);

  factory FavoriteModel.fromFirebaseJson(Map<Object?, Object?> json, {String? remoteId}) {
    return FavoriteModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      section: json['section'] == null
          ? null
          : SectionModel.fromFirebaseJson(
              json['section'] as Map<Object?, Object?>,
            ),
      taskList: json['task_list'] == null
          ? null
          : TaskListModel.fromFirebaseJson(
              json['task_list'] as Map<Object?, Object?>,
            ),
    );
  }

  static FavoriteModel? fromEntity(Favorite? favorite) {
    if (favorite == null) return null;
    return FavoriteModel(
      id: favorite.id,
      userId: favorite.userId,
      section: SectionModel.fromEntity(favorite.section),
      taskList: TaskListModel.fromEntity(favorite.taskList),
    );
  }
}
