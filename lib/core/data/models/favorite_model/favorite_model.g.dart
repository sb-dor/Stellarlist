// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteModelImpl _$$FavoriteModelImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteModelImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      section: json['section'] == null
          ? null
          : SectionModel.fromJson(json['section'] as Map<String, dynamic>),
      taskList: json['taskList'] == null
          ? null
          : TaskListModel.fromJson(json['taskList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'section': instance.section?.toJson(),
      'taskList': instance.taskList?.toJson(),
    };
