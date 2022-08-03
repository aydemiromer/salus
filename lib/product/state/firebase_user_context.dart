import '../model/user/user_model.dart';

class FirebaseUserContext {
  final Map<String, UserModel> _firebaseUsers = {};

  void addUser(String id, UserModel model) {
    _firebaseUsers[id] = model;
  }

  UserModel? getUser(String id) => _firebaseUsers[id];

  Future<UserModel?> fetchAndAddUser(String id,  userCollection) async {
    if (_firebaseUsers.containsKey(id)) {
      return _firebaseUsers[id];
    }

    final response = await userCollection.doc(id).get();
    if (response.data != null) {
      _firebaseUsers[id] = response.data!;
    }

    return response.data;
  }
}
