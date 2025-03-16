import 'package:bloc_pattern_example/data/data_provider/WebProvider.dart';

class WebRepo {
  final WebProvider _webProvider = WebProvider();

  Future<String> fetchWebData() async {
    return await _webProvider.fetchWeb();
  }
}