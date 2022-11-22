// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @HiveType(typeId: 0, adapterName: 'UserModelAdapter')
  const factory UserModel({
    @JsonKey(name: 'id') @HiveField(0) required String id,
    @JsonKey(name: 'ucode') @HiveField(1) required String ucode,
    @JsonKey(name: 'rcode') @HiveField(2) required String rcode,
    @JsonKey(name: 'timezome') @HiveField(3) String? timezone,
    @JsonKey(name: 'firstprofile') @HiveField(4) bool? firstProfile,
    @JsonKey(name: 'nickname') @HiveField(5) required String nickname,
    @JsonKey(name: 'header') @HiveField(6) String? headerImg,
    @JsonKey(name: 'profile') @HiveField(7) String? profileImg,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
