import 'package:http/http.dart' as http;

class WebProvider {
  Future<String> fetchWeb() async {

    // wait for 2 seconds
    await Future.delayed(Duration(seconds: 2));

    final response = await http.get(Uri.parse('http://localhost:8080'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load web');
    }
  }
}