import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../chat/service/Ifirebase_service.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.firebaseService) : super(const ProfileState());

  final IFirebaseService firebaseService;
  Future init() async {
    final prefs = await SharedPreferences.getInstance();

    final String? name = prefs.getString('name');
    final String? surName = prefs.getString('surname');

    emit(state.copyWith(name: name, surname: surName));
  }

  Future updateUserProfile(String name, String surname, context) async {
    await firebaseService.updateProfile(name, surname);

    Navigator.pop(context);
  }
}
