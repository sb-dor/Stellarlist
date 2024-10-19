import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/data/models/section_model/section_model.dart';
import 'package:stellarlist/core/data/models/task_list_model/task_list_model.dart';
import 'package:stellarlist/core/domain/entities/favorite.dart';

part 'favorite_model.g.dart';

part 'favorite_model.freezed.dart';

@freezed
class FavoriteModel extends Favorite with _$FavoriteModel {
  factory FavoriteModel({
    SectionModel? section,
    TaskListModel? taskList,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, Object?> json) => _$FavoriteModelFromJson(json);
}
