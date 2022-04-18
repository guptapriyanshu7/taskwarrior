// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskTearOff {
  const _$TaskTearOff();

  _Task call(
      {required String id,
      required String description,
      required DateTime createdAt,
      required int urgency,
      bool isPending = true,
      String? dependsOnTaskId,
      String? projectId,
      DateTime? due,
      DateTime? updatedAt}) {
    return _Task(
      id: id,
      description: description,
      createdAt: createdAt,
      urgency: urgency,
      isPending: isPending,
      dependsOnTaskId: dependsOnTaskId,
      projectId: projectId,
      due: due,
      updatedAt: updatedAt,
    );
  }
}

/// @nodoc
const $Task = _$TaskTearOff();

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get urgency => throw _privateConstructorUsedError;
  bool get isPending => throw _privateConstructorUsedError;
  String? get dependsOnTaskId => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  DateTime? get due => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String description,
      DateTime createdAt,
      int urgency,
      bool isPending,
      String? dependsOnTaskId,
      String? projectId,
      DateTime? due,
      DateTime? updatedAt});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? urgency = freezed,
    Object? isPending = freezed,
    Object? dependsOnTaskId = freezed,
    Object? projectId = freezed,
    Object? due = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      urgency: urgency == freezed
          ? _value.urgency
          : urgency // ignore: cast_nullable_to_non_nullable
              as int,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      dependsOnTaskId: dependsOnTaskId == freezed
          ? _value.dependsOnTaskId
          : dependsOnTaskId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      due: due == freezed
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) then) =
      __$TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String description,
      DateTime createdAt,
      int urgency,
      bool isPending,
      String? dependsOnTaskId,
      String? projectId,
      DateTime? due,
      DateTime? updatedAt});
}

/// @nodoc
class __$TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(_Task _value, $Res Function(_Task) _then)
      : super(_value, (v) => _then(v as _Task));

  @override
  _Task get _value => super._value as _Task;

  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? urgency = freezed,
    Object? isPending = freezed,
    Object? dependsOnTaskId = freezed,
    Object? projectId = freezed,
    Object? due = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Task(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      urgency: urgency == freezed
          ? _value.urgency
          : urgency // ignore: cast_nullable_to_non_nullable
              as int,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      dependsOnTaskId: dependsOnTaskId == freezed
          ? _value.dependsOnTaskId
          : dependsOnTaskId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      due: due == freezed
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_Task implements _Task {
  const _$_Task(
      {required this.id,
      required this.description,
      required this.createdAt,
      required this.urgency,
      this.isPending = true,
      this.dependsOnTaskId,
      this.projectId,
      this.due,
      this.updatedAt});

  @override
  final String id;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final int urgency;
  @JsonKey()
  @override
  final bool isPending;
  @override
  final String? dependsOnTaskId;
  @override
  final String? projectId;
  @override
  final DateTime? due;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Task(id: $id, description: $description, createdAt: $createdAt, urgency: $urgency, isPending: $isPending, dependsOnTaskId: $dependsOnTaskId, projectId: $projectId, due: $due, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Task &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.urgency, urgency) &&
            const DeepCollectionEquality().equals(other.isPending, isPending) &&
            const DeepCollectionEquality()
                .equals(other.dependsOnTaskId, dependsOnTaskId) &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality().equals(other.due, due) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(urgency),
      const DeepCollectionEquality().hash(isPending),
      const DeepCollectionEquality().hash(dependsOnTaskId),
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(due),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);
}

abstract class _Task implements Task {
  const factory _Task(
      {required String id,
      required String description,
      required DateTime createdAt,
      required int urgency,
      bool isPending,
      String? dependsOnTaskId,
      String? projectId,
      DateTime? due,
      DateTime? updatedAt}) = _$_Task;

  @override
  String get id;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  int get urgency;
  @override
  bool get isPending;
  @override
  String? get dependsOnTaskId;
  @override
  String? get projectId;
  @override
  DateTime? get due;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$TaskCopyWith<_Task> get copyWith => throw _privateConstructorUsedError;
}
