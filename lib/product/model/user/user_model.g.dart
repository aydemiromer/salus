// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user/user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userID: json['userID'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      status: json['status'] as String?,
      assignment: json['assignment'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userID': instance.userID,
      'name': instance.name,
      'surname': instance.surname,
      'status': instance.status,
      'assignment': instance.assignment,
    };
