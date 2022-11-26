// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String,
      ucode: json['ucode'] as String,
      rcode: json['rcode'] as String,
      timezone: json['timezone'] as String?,
      firstProfile: json['firstprofile'] as bool?,
      nickname: json['nickname'] as String,
      apiKey: json['apikey'] as String,
      headerImg: json['header'] as String?,
      profileImg: json['profile'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ucode': instance.ucode,
      'rcode': instance.rcode,
      'timezone': instance.timezone,
      'firstprofile': instance.firstProfile,
      'nickname': instance.nickname,
      'apikey': instance.apiKey,
      'header': instance.headerImg,
      'profile': instance.profileImg,
    };
