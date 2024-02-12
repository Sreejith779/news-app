import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchNews(String query) async {
  final response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=abb93b24ee31476d900ddae32b50bc72&q=" +
          query));

  if (response.statusCode == 200) {
    Map<String, dynamic> result = jsonDecode(response.body);
    print("Fetched");
    return result['articles'] ?? [];
  } else {
    // Handle errors here, such as returning an empty list or throwing an exception
    print('Failed to load news');
    return [];
  }
}
