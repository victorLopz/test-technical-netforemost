import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:list_view_app/models/articles.dart';

class ApiService {
  final String apiUrl = 'http://localhost:5050/api/v1/articles';

  Future<List<Articles>> fetchArticles() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      return articlesResponse.data;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
