// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionModelImpl _$$SectionModelImplFromJson(Map<String, dynamic> json) =>
    _$SectionModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      taskLists: (json['taskLists'] as List<dynamic>?)
          ?.map((e) => TaskListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SectionModelImplToJson(_$SectionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'taskLists': instance.taskLists?.map((e) => e.toJson()).toList(),
    };
