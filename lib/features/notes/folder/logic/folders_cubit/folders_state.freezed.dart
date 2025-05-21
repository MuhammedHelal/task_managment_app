// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoldersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getAllFoldersAndNotesSuccess,
    required TResult Function(String error) error,
    required TResult Function(
            FolderEntity folderEntity, int selectedFolderIndex)
        selectFolder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllFoldersAndNotesSuccess,
    TResult? Function(String error)? error,
    TResult? Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllFoldersAndNotesSuccess,
    TResult Function(String error)? error,
    TResult Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetAllFoldersAndNotesSuccess value)
        getAllFoldersAndNotesSuccess,
    required TResult Function(Error value) error,
    required TResult Function(SelectFolder value) selectFolder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult? Function(Error value)? error,
    TResult? Function(SelectFolder value)? selectFolder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult Function(Error value)? error,
    TResult Function(SelectFolder value)? selectFolder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoldersStateCopyWith<$Res> {
  factory $FoldersStateCopyWith(
          FoldersState value, $Res Function(FoldersState) then) =
      _$FoldersStateCopyWithImpl<$Res, FoldersState>;
}

/// @nodoc
class _$FoldersStateCopyWithImpl<$Res, $Val extends FoldersState>
    implements $FoldersStateCopyWith<$Res> {
  _$FoldersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoldersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FoldersStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoldersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FoldersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getAllFoldersAndNotesSuccess,
    required TResult Function(String error) error,
    required TResult Function(
            FolderEntity folderEntity, int selectedFolderIndex)
        selectFolder,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllFoldersAndNotesSuccess,
    TResult? Function(String error)? error,
    TResult? Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllFoldersAndNotesSuccess,
    TResult Function(String error)? error,
    TResult Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetAllFoldersAndNotesSuccess value)
        getAllFoldersAndNotesSuccess,
    required TResult Function(Error value) error,
    required TResult Function(SelectFolder value) selectFolder,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult? Function(Error value)? error,
    TResult? Function(SelectFolder value)? selectFolder,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult Function(Error value)? error,
    TResult Function(SelectFolder value)? selectFolder,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FoldersState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GetAllFoldersAndNotesSuccessImplCopyWith<$Res> {
  factory _$$GetAllFoldersAndNotesSuccessImplCopyWith(
          _$GetAllFoldersAndNotesSuccessImpl value,
          $Res Function(_$GetAllFoldersAndNotesSuccessImpl) then) =
      __$$GetAllFoldersAndNotesSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllFoldersAndNotesSuccessImplCopyWithImpl<$Res>
    extends _$FoldersStateCopyWithImpl<$Res, _$GetAllFoldersAndNotesSuccessImpl>
    implements _$$GetAllFoldersAndNotesSuccessImplCopyWith<$Res> {
  __$$GetAllFoldersAndNotesSuccessImplCopyWithImpl(
      _$GetAllFoldersAndNotesSuccessImpl _value,
      $Res Function(_$GetAllFoldersAndNotesSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoldersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetAllFoldersAndNotesSuccessImpl
    implements GetAllFoldersAndNotesSuccess {
  const _$GetAllFoldersAndNotesSuccessImpl();

  @override
  String toString() {
    return 'FoldersState.getAllFoldersAndNotesSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllFoldersAndNotesSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getAllFoldersAndNotesSuccess,
    required TResult Function(String error) error,
    required TResult Function(
            FolderEntity folderEntity, int selectedFolderIndex)
        selectFolder,
  }) {
    return getAllFoldersAndNotesSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllFoldersAndNotesSuccess,
    TResult? Function(String error)? error,
    TResult? Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
  }) {
    return getAllFoldersAndNotesSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllFoldersAndNotesSuccess,
    TResult Function(String error)? error,
    TResult Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
    required TResult orElse(),
  }) {
    if (getAllFoldersAndNotesSuccess != null) {
      return getAllFoldersAndNotesSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetAllFoldersAndNotesSuccess value)
        getAllFoldersAndNotesSuccess,
    required TResult Function(Error value) error,
    required TResult Function(SelectFolder value) selectFolder,
  }) {
    return getAllFoldersAndNotesSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult? Function(Error value)? error,
    TResult? Function(SelectFolder value)? selectFolder,
  }) {
    return getAllFoldersAndNotesSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult Function(Error value)? error,
    TResult Function(SelectFolder value)? selectFolder,
    required TResult orElse(),
  }) {
    if (getAllFoldersAndNotesSuccess != null) {
      return getAllFoldersAndNotesSuccess(this);
    }
    return orElse();
  }
}

abstract class GetAllFoldersAndNotesSuccess implements FoldersState {
  const factory GetAllFoldersAndNotesSuccess() =
      _$GetAllFoldersAndNotesSuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$FoldersStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoldersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'FoldersState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of FoldersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getAllFoldersAndNotesSuccess,
    required TResult Function(String error) error,
    required TResult Function(
            FolderEntity folderEntity, int selectedFolderIndex)
        selectFolder,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllFoldersAndNotesSuccess,
    TResult? Function(String error)? error,
    TResult? Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllFoldersAndNotesSuccess,
    TResult Function(String error)? error,
    TResult Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetAllFoldersAndNotesSuccess value)
        getAllFoldersAndNotesSuccess,
    required TResult Function(Error value) error,
    required TResult Function(SelectFolder value) selectFolder,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult? Function(Error value)? error,
    TResult? Function(SelectFolder value)? selectFolder,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult Function(Error value)? error,
    TResult Function(SelectFolder value)? selectFolder,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements FoldersState {
  const factory Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of FoldersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectFolderImplCopyWith<$Res> {
  factory _$$SelectFolderImplCopyWith(
          _$SelectFolderImpl value, $Res Function(_$SelectFolderImpl) then) =
      __$$SelectFolderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FolderEntity folderEntity, int selectedFolderIndex});
}

/// @nodoc
class __$$SelectFolderImplCopyWithImpl<$Res>
    extends _$FoldersStateCopyWithImpl<$Res, _$SelectFolderImpl>
    implements _$$SelectFolderImplCopyWith<$Res> {
  __$$SelectFolderImplCopyWithImpl(
      _$SelectFolderImpl _value, $Res Function(_$SelectFolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoldersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderEntity = null,
    Object? selectedFolderIndex = null,
  }) {
    return _then(_$SelectFolderImpl(
      folderEntity: null == folderEntity
          ? _value.folderEntity
          : folderEntity // ignore: cast_nullable_to_non_nullable
              as FolderEntity,
      selectedFolderIndex: null == selectedFolderIndex
          ? _value.selectedFolderIndex
          : selectedFolderIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectFolderImpl implements SelectFolder {
  const _$SelectFolderImpl(
      {required this.folderEntity, required this.selectedFolderIndex});

  @override
  final FolderEntity folderEntity;
  @override
  final int selectedFolderIndex;

  @override
  String toString() {
    return 'FoldersState.selectFolder(folderEntity: $folderEntity, selectedFolderIndex: $selectedFolderIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectFolderImpl &&
            (identical(other.folderEntity, folderEntity) ||
                other.folderEntity == folderEntity) &&
            (identical(other.selectedFolderIndex, selectedFolderIndex) ||
                other.selectedFolderIndex == selectedFolderIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, folderEntity, selectedFolderIndex);

  /// Create a copy of FoldersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectFolderImplCopyWith<_$SelectFolderImpl> get copyWith =>
      __$$SelectFolderImplCopyWithImpl<_$SelectFolderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getAllFoldersAndNotesSuccess,
    required TResult Function(String error) error,
    required TResult Function(
            FolderEntity folderEntity, int selectedFolderIndex)
        selectFolder,
  }) {
    return selectFolder(folderEntity, selectedFolderIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllFoldersAndNotesSuccess,
    TResult? Function(String error)? error,
    TResult? Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
  }) {
    return selectFolder?.call(folderEntity, selectedFolderIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllFoldersAndNotesSuccess,
    TResult Function(String error)? error,
    TResult Function(FolderEntity folderEntity, int selectedFolderIndex)?
        selectFolder,
    required TResult orElse(),
  }) {
    if (selectFolder != null) {
      return selectFolder(folderEntity, selectedFolderIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetAllFoldersAndNotesSuccess value)
        getAllFoldersAndNotesSuccess,
    required TResult Function(Error value) error,
    required TResult Function(SelectFolder value) selectFolder,
  }) {
    return selectFolder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult? Function(Error value)? error,
    TResult? Function(SelectFolder value)? selectFolder,
  }) {
    return selectFolder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetAllFoldersAndNotesSuccess value)?
        getAllFoldersAndNotesSuccess,
    TResult Function(Error value)? error,
    TResult Function(SelectFolder value)? selectFolder,
    required TResult orElse(),
  }) {
    if (selectFolder != null) {
      return selectFolder(this);
    }
    return orElse();
  }
}

abstract class SelectFolder implements FoldersState {
  const factory SelectFolder(
      {required final FolderEntity folderEntity,
      required final int selectedFolderIndex}) = _$SelectFolderImpl;

  FolderEntity get folderEntity;
  int get selectedFolderIndex;

  /// Create a copy of FoldersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectFolderImplCopyWith<_$SelectFolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
