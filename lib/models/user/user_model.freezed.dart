// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ucode')
  @HiveField(1)
  String get ucode => throw _privateConstructorUsedError;
  @JsonKey(name: 'rcode')
  @HiveField(2)
  String get rcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'timezome')
  @HiveField(3)
  String? get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstprofile')
  @HiveField(4)
  bool? get firstProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'nickname')
  @HiveField(5)
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'header')
  @HiveField(6)
  String? get headerImg => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile')
  @HiveField(7)
  String? get profileImg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) String id,
      @JsonKey(name: 'ucode') @HiveField(1) String ucode,
      @JsonKey(name: 'rcode') @HiveField(2) String rcode,
      @JsonKey(name: 'timezome') @HiveField(3) String? timezone,
      @JsonKey(name: 'firstprofile') @HiveField(4) bool? firstProfile,
      @JsonKey(name: 'nickname') @HiveField(5) String nickname,
      @JsonKey(name: 'header') @HiveField(6) String? headerImg,
      @JsonKey(name: 'profile') @HiveField(7) String? profileImg});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ucode = null,
    Object? rcode = null,
    Object? timezone = freezed,
    Object? firstProfile = freezed,
    Object? nickname = null,
    Object? headerImg = freezed,
    Object? profileImg = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ucode: null == ucode
          ? _value.ucode
          : ucode // ignore: cast_nullable_to_non_nullable
              as String,
      rcode: null == rcode
          ? _value.rcode
          : rcode // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      firstProfile: freezed == firstProfile
          ? _value.firstProfile
          : firstProfile // ignore: cast_nullable_to_non_nullable
              as bool?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      headerImg: freezed == headerImg
          ? _value.headerImg
          : headerImg // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) String id,
      @JsonKey(name: 'ucode') @HiveField(1) String ucode,
      @JsonKey(name: 'rcode') @HiveField(2) String rcode,
      @JsonKey(name: 'timezome') @HiveField(3) String? timezone,
      @JsonKey(name: 'firstprofile') @HiveField(4) bool? firstProfile,
      @JsonKey(name: 'nickname') @HiveField(5) String nickname,
      @JsonKey(name: 'header') @HiveField(6) String? headerImg,
      @JsonKey(name: 'profile') @HiveField(7) String? profileImg});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ucode = null,
    Object? rcode = null,
    Object? timezone = freezed,
    Object? firstProfile = freezed,
    Object? nickname = null,
    Object? headerImg = freezed,
    Object? profileImg = freezed,
  }) {
    return _then(_$_UserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ucode: null == ucode
          ? _value.ucode
          : ucode // ignore: cast_nullable_to_non_nullable
              as String,
      rcode: null == rcode
          ? _value.rcode
          : rcode // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      firstProfile: freezed == firstProfile
          ? _value.firstProfile
          : firstProfile // ignore: cast_nullable_to_non_nullable
              as bool?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      headerImg: freezed == headerImg
          ? _value.headerImg
          : headerImg // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'UserModelAdapter')
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'ucode') @HiveField(1) required this.ucode,
      @JsonKey(name: 'rcode') @HiveField(2) required this.rcode,
      @JsonKey(name: 'timezome') @HiveField(3) this.timezone,
      @JsonKey(name: 'firstprofile') @HiveField(4) this.firstProfile,
      @JsonKey(name: 'nickname') @HiveField(5) required this.nickname,
      @JsonKey(name: 'header') @HiveField(6) this.headerImg,
      @JsonKey(name: 'profile') @HiveField(7) this.profileImg});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final String id;
  @override
  @JsonKey(name: 'ucode')
  @HiveField(1)
  final String ucode;
  @override
  @JsonKey(name: 'rcode')
  @HiveField(2)
  final String rcode;
  @override
  @JsonKey(name: 'timezome')
  @HiveField(3)
  final String? timezone;
  @override
  @JsonKey(name: 'firstprofile')
  @HiveField(4)
  final bool? firstProfile;
  @override
  @JsonKey(name: 'nickname')
  @HiveField(5)
  final String nickname;
  @override
  @JsonKey(name: 'header')
  @HiveField(6)
  final String? headerImg;
  @override
  @JsonKey(name: 'profile')
  @HiveField(7)
  final String? profileImg;

  @override
  String toString() {
    return 'UserModel(id: $id, ucode: $ucode, rcode: $rcode, timezone: $timezone, firstProfile: $firstProfile, nickname: $nickname, headerImg: $headerImg, profileImg: $profileImg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ucode, ucode) || other.ucode == ucode) &&
            (identical(other.rcode, rcode) || other.rcode == rcode) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.firstProfile, firstProfile) ||
                other.firstProfile == firstProfile) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.headerImg, headerImg) ||
                other.headerImg == headerImg) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ucode, rcode, timezone,
      firstProfile, nickname, headerImg, profileImg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: 'id')
      @HiveField(0)
          required final String id,
      @JsonKey(name: 'ucode')
      @HiveField(1)
          required final String ucode,
      @JsonKey(name: 'rcode')
      @HiveField(2)
          required final String rcode,
      @JsonKey(name: 'timezome')
      @HiveField(3)
          final String? timezone,
      @JsonKey(name: 'firstprofile')
      @HiveField(4)
          final bool? firstProfile,
      @JsonKey(name: 'nickname')
      @HiveField(5)
          required final String nickname,
      @JsonKey(name: 'header')
      @HiveField(6)
          final String? headerImg,
      @JsonKey(name: 'profile')
      @HiveField(7)
          final String? profileImg}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  String get id;
  @override
  @JsonKey(name: 'ucode')
  @HiveField(1)
  String get ucode;
  @override
  @JsonKey(name: 'rcode')
  @HiveField(2)
  String get rcode;
  @override
  @JsonKey(name: 'timezome')
  @HiveField(3)
  String? get timezone;
  @override
  @JsonKey(name: 'firstprofile')
  @HiveField(4)
  bool? get firstProfile;
  @override
  @JsonKey(name: 'nickname')
  @HiveField(5)
  String get nickname;
  @override
  @JsonKey(name: 'header')
  @HiveField(6)
  String? get headerImg;
  @override
  @JsonKey(name: 'profile')
  @HiveField(7)
  String? get profileImg;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
