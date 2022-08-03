import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel with EquatableMixin {
  String? userID;
  String? name;
  String? surname;
  String? status;
  String? assignment;

  UserModel({this.userID, this.name, this.surname, this.status, this.assignment});

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
        assignment = map['assignment'];

  @override
  Map<String, dynamic> toMap() {
    return {'userID': userID, 'name': name, 'surname': surname, 'status': status, 'assignment': assignment};
  }

  @override
  String toString() {
    return 'UserModel{userID: $userID, name: $name, surname: $surname, status: $status, assignment = $assignment}';
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserModelToJson(this);
  }

  @override
  List<Object?> get props {
    return [userID, name, surname, status, assignment];
  }
}

