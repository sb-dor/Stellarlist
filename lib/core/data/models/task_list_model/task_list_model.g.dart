// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskListModelImpl _$$TaskListModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskListModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TaskListModelImplToJson(_$TaskListModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tasks': instance.tasks?.map((e) => e.toJson()).toList(),
    };
