part of 'profile_cubit.dart';


class ProfileState extends Equatable {
  final String? name;
  final String? surname;

  const ProfileState({this.name, this.surname});

  @override
  List<Object?> get props => [name, surname];

  ProfileState copyWith({String? name, String? surname}) {
    return ProfileState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }
}
