import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/domain/entities/assignee/assignee.dart';

part 'assignee_model.freezed.dart';

part 'assignee_model.g.dart';

@freezed
 class AssigneeModel extends Assignee with _$AssigneeModel {
  factory AssigneeModel({
    String? id,
  }) = _AssigneeModel;

  factory AssigneeModel.fromJson(Map<String, Object?> json) => _$AssigneeModelFromJson(json);
}
