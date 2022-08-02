import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User with EquatableMixin {
  String? userID;
  String? name;
  String? surname;
  String? status;
  String? assignment;

  User({this.userID, this.name, this.surname, this.status, this.assignment});

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  @override
  User.fromMap(Map<String, dynamic> map)
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
    return 'User{userID: $userID, name: $name, surname: $surname, status: $status, assignment = $assignment}';
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserToJson(this);
  }

  @override
  List<Object?> get props {
    return [userID, name, surname, status, assignment];
  }
}