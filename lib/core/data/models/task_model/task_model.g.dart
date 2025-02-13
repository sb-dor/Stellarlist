// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      section: json['section'] == null
          ? null
          : SectionModel.fromJson(json['section'] as Map<String, dynamic>),
      assignee: json['assignee'] == null
          ? null
          : AssigneeModel.fromJson(json['assignee'] as Map<String, dynamic>),
      label: json['label'] == null
          ? null
          : LabelModel.fromJson(json['label'] as Map<String, dynamic>),
      subtasks: (json['subtasks'] as List<dynamic>?)
          ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isDone: json['is_done'] as bool?,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'section': instance.section?.toJson(),
      'assignee': instance.assignee?.toJson(),
      'label': instance.label?.toJson(),
      'subtasks': instance.subtasks?.map((e) => e.toJson()).toList(),
      'is_done': instance.isDone,
    };
