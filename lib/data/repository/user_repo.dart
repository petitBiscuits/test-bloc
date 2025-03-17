import 'package:bloc_pattern_example/data/data_provider/user_provider.dart';

class UserRepo {
  final UserProvider _userProvider = UserProvider();

  Future<String> getUserName() async {
    return await _userProvider.getUser();
  }

  void addUserName(String text) {
    _userProvider.addUser(text);
  }
}