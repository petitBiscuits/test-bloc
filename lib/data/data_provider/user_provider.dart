class UserProvider {
  String _user = "Henrique";

  Future<String> getUser() async {
    // wait for 2 seconds
    await Future.delayed(Duration(seconds: 2));

    final response = (statusCode: 200, data: _user);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load web');
    }
  }

  void addUser(String text) {
    _user = _user + text;
  }
}
