// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskListModel _$TaskListModelFromJson(Map<String, dynamic> json) {
  return _TaskListModel.fromJson(json);
}

/// @nodoc
mixin _$TaskListModel {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<TaskModel>? get tasks => throw _privateConstructorUsedError;

  /// Serializes this TaskListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskListModelCopyWith<TaskListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListModelCopyWith<$Res> {
  factory $TaskListModelCopyWith(
          TaskListModel value, $Res Function(TaskListModel) then) =
      _$TaskListModelCopyWithImpl<$Res, TaskListModel>;
  @useResult
  $Res call({String? id, String? title, List<TaskModel>? tasks});
}

/// @nodoc
class _$TaskListModelCopyWithImpl<$Res, $Val extends TaskListModel>
    implements $TaskListModelCopyWith<$Res> {
  _$TaskListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskListModelImplCopyWith<$Res>
    implements $TaskListModelCopyWith<$Res> {
  factory _$$TaskListModelImplCopyWith(
          _$TaskListModelImpl value, $Res Function(_$TaskListModelImpl) then) =
      __$$TaskListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? title, List<TaskModel>? tasks});
}

/// @nodoc
class __$$TaskListModelImplCopyWithImpl<$Res>
    extends _$TaskListModelCopyWithImpl<$Res, _$TaskListModelImpl>
    implements _$$TaskListModelImplCopyWith<$Res> {
  __$$TaskListModelImplCopyWithImpl(
      _$TaskListModelImpl _value, $Res Function(_$TaskListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_$TaskListModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskListModelImpl implements _TaskListModel {
  _$TaskListModelImpl({this.id, this.title, final List<TaskModel>? tasks})
      : _tasks = tasks;

  factory _$TaskListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskListModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  final List<TaskModel>? _tasks;
  @override
  List<TaskModel>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskListModel(id: $id, title: $title, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskListModelImplCopyWith<_$TaskListModelImpl> get copyWith =>
      __$$TaskListModelImplCopyWithImpl<_$TaskListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskListModelImplToJson(
      this,
    );
  }
}

abstract class _TaskListModel implements TaskListModel {
  factory _TaskListModel(
      {final String? id,
      final String? title,
      final List<TaskModel>? tasks}) = _$TaskListModelImpl;

  factory _TaskListModel.fromJson(Map<String, dynamic> json) =
      _$TaskListModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  List<TaskModel>? get tasks;

  /// Create a copy of TaskListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskListModelImplCopyWith<_$TaskListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
