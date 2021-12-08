// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of models;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  AppState$ call(
      {List<Photo> images = const <Photo>[],
      bool isLoading = false,
      String username = 'hans_isaacson',
      int page = 1,
      String avatar =
          'https://images.unsplash.com/profile-1612247405939-6cdf7a3cc024image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128'}) {
    return AppState$(
      images: images,
      isLoading: isLoading,
      username: username,
      page: page,
      avatar: avatar,
    );
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  List<Photo> get images => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) = _$AppStateCopyWithImpl<$Res>;
  $Res call({List<Photo> images, bool isLoading, String username, int page, String avatar});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? images = freezed,
    Object? isLoading = freezed,
    Object? username = freezed,
    Object? page = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $AppState$CopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory $AppState$CopyWith(AppState$ value, $Res Function(AppState$) then) = _$AppState$CopyWithImpl<$Res>;
  @override
  $Res call({List<Photo> images, bool isLoading, String username, int page, String avatar});
}

/// @nodoc
class _$AppState$CopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res> implements $AppState$CopyWith<$Res> {
  _$AppState$CopyWithImpl(AppState$ _value, $Res Function(AppState$) _then)
      : super(_value, (v) => _then(v as AppState$));

  @override
  AppState$ get _value => super._value as AppState$;

  @override
  $Res call({
    Object? images = freezed,
    Object? isLoading = freezed,
    Object? username = freezed,
    Object? page = freezed,
    Object? avatar = freezed,
  }) {
    return _then(AppState$(
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppState$ implements AppState$ {
  const _$AppState$(
      {this.images = const <Photo>[],
      this.isLoading = false,
      this.username = 'hans_isaacson',
      this.page = 1,
      this.avatar =
          'https://images.unsplash.com/profile-1612247405939-6cdf7a3cc024image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128'});

  @JsonKey(defaultValue: const <Photo>[])
  @override
  final List<Photo> images;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: 'hans_isaacson')
  @override
  final String username;
  @JsonKey(defaultValue: 1)
  @override
  final int page;
  @JsonKey(
      defaultValue:
          'https://images.unsplash.com/profile-1612247405939-6cdf7a3cc024image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128')
  @override
  final String avatar;

  @override
  String toString() {
    return 'AppState(images: $images, isLoading: $isLoading, username: $username, page: $page, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppState$ &&
            const DeepCollectionEquality().equals(other.images, images) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.avatar, avatar));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(images),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(avatar));

  @JsonKey(ignore: true)
  @override
  $AppState$CopyWith<AppState$> get copyWith => _$AppState$CopyWithImpl<AppState$>(this, _$identity);
}

abstract class AppState$ implements AppState {
  const factory AppState$({List<Photo> images, bool isLoading, String username, int page, String avatar}) = _$AppState$;

  @override
  List<Photo> get images;
  @override
  bool get isLoading;
  @override
  String get username;
  @override
  int get page;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  $AppState$CopyWith<AppState$> get copyWith => throw _privateConstructorUsedError;
}

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo$.fromJson(json);
}

/// @nodoc
class _$PhotoTearOff {
  const _$PhotoTearOff();

  Photo$ call({@JsonKey(name: 'small') required String image, required String description}) {
    return Photo$(
      image: image,
      description: description,
    );
  }

  Photo fromJson(Map<String, Object?> json) {
    return Photo.fromJson(json);
  }
}

/// @nodoc
const $Photo = _$PhotoTearOff();

/// @nodoc
mixin _$Photo {
  @JsonKey(name: 'small')
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoCopyWith<Photo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoCopyWith<$Res> {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) then) = _$PhotoCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'small') String image, String description});
}

/// @nodoc
class _$PhotoCopyWithImpl<$Res> implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._value, this._then);

  final Photo _value;
  // ignore: unused_field
  final $Res Function(Photo) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $Photo$CopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory $Photo$CopyWith(Photo$ value, $Res Function(Photo$) then) = _$Photo$CopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'small') String image, String description});
}

/// @nodoc
class _$Photo$CopyWithImpl<$Res> extends _$PhotoCopyWithImpl<$Res> implements $Photo$CopyWith<$Res> {
  _$Photo$CopyWithImpl(Photo$ _value, $Res Function(Photo$) _then) : super(_value, (v) => _then(v as Photo$));

  @override
  Photo$ get _value => super._value as Photo$;

  @override
  $Res call({
    Object? image = freezed,
    Object? description = freezed,
  }) {
    return _then(Photo$(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Photo$ implements Photo$ {
  _$Photo$({@JsonKey(name: 'small') required this.image, required this.description});

  factory _$Photo$.fromJson(Map<String, dynamic> json) => _$$Photo$FromJson(json);

  @override
  @JsonKey(name: 'small')
  final String image;
  @override
  final String description;

  @override
  String toString() {
    return 'Photo(image: $image, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Photo$ &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(image), const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  $Photo$CopyWith<Photo$> get copyWith => _$Photo$CopyWithImpl<Photo$>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Photo$ToJson(this);
  }
}

abstract class Photo$ implements Photo {
  factory Photo$({@JsonKey(name: 'small') required String image, required String description}) = _$Photo$;

  factory Photo$.fromJson(Map<String, dynamic> json) = _$Photo$.fromJson;

  @override
  @JsonKey(name: 'small')
  String get image;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  $Photo$CopyWith<Photo$> get copyWith => throw _privateConstructorUsedError;
}
