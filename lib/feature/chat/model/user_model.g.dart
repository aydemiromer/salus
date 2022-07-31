// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userID: json['userID'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      status: json['status'] as String?,
      assignment: json['assignment'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userID': instance.userID,
      'name': instance.name,
      'surname': instance.surname,
      'status': instance.status,
      'assignment': instance.assignment,
    };
