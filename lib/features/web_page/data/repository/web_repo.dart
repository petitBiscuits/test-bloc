import 'package:bloc_pattern_example/features/web_page/data/provider/WebProvider.dart';

class WebRepo {
  final WebProvider _webProvider = WebProvider();

  Future<String> fetchWebData() async {
    return await "Localhost:8080";//_webProvider.fetchWeb();
  }
}