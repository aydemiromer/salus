import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel with EquatableMixin {
  final String? userID;
  final String? name;
  final String? surname;
  final String? status;
  final String? assignment;
  final String? deviceToken;
  final String? message;
  final String? role;

  UserModel(
      {this.userID, this.name, this.surname, this.status, this.assignment, this.deviceToken, this.message, this.role});

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  @override
  UserModel.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        name = map['name'],
        surname = map['surname'],
        status = map['status'],
        assignment = map['assignment'],
        deviceToken = map['deviceToken'],
        message = map['message'],
        role = map['role'];

  @override
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'name': name,
      'surname': surname,
      'status': status,
      'assignment': assignment,
      'deviceToken': deviceToken,
      'message': message,
      'role': role
    };
  }

  @override
  String toString() {
    return 'UserModel{userID: $userID, name: $name, surname: $surname, status: $status, assignment = $assignment, deviceToken = $deviceToken , message = $message, role = $role}';
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserModelToJson(this);
  }

  @override
  List<Object?> get props {
    return [userID, name, surname, status, assignment, deviceToken, message, role];
  }
}
