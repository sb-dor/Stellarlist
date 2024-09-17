// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssigneeModel _$AssigneeModelFromJson(Map<String, dynamic> json) {
  return _AssigneeModel.fromJson(json);
}

/// @nodoc
mixin _$AssigneeModel {
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this AssigneeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssigneeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssigneeModelCopyWith<AssigneeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssigneeModelCopyWith<$Res> {
  factory $AssigneeModelCopyWith(
          AssigneeModel value, $Res Function(AssigneeModel) then) =
      _$AssigneeModelCopyWithImpl<$Res, AssigneeModel>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class _$AssigneeModelCopyWithImpl<$Res, $Val extends AssigneeModel>
    implements $AssigneeModelCopyWith<$Res> {
  _$AssigneeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssigneeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssigneeModelImplCopyWith<$Res>
    implements $AssigneeModelCopyWith<$Res> {
  factory _$$AssigneeModelImplCopyWith(
          _$AssigneeModelImpl value, $Res Function(_$AssigneeModelImpl) then) =
      __$$AssigneeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$AssigneeModelImplCopyWithImpl<$Res>
    extends _$AssigneeModelCopyWithImpl<$Res, _$AssigneeModelImpl>
    implements _$$AssigneeModelImplCopyWith<$Res> {
  __$$AssigneeModelImplCopyWithImpl(
      _$AssigneeModelImpl _value, $Res Function(_$AssigneeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssigneeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$AssigneeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssigneeModelImpl implements _AssigneeModel {
  _$AssigneeModelImpl({this.id});

  factory _$AssigneeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssigneeModelImplFromJson(json);

  @override
  final String? id;

  @override
  String toString() {
    return 'AssigneeModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssigneeModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AssigneeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssigneeModelImplCopyWith<_$AssigneeModelImpl> get copyWith =>
      __$$AssigneeModelImplCopyWithImpl<_$AssigneeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssigneeModelImplToJson(
      this,
    );
  }
}

abstract class _AssigneeModel implements AssigneeModel {
  factory _AssigneeModel({final String? id}) = _$AssigneeModelImpl;

  factory _AssigneeModel.fromJson(Map<String, dynamic> json) =
      _$AssigneeModelImpl.fromJson;

  @override
  String? get id;

  /// Create a copy of AssigneeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssigneeModelImplCopyWith<_$AssigneeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
