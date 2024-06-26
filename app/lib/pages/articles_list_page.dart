import 'package:flutter/material.dart';
import 'package:list_view_app/models/articles.dart';
import 'package:list_view_app/service/api_service.dart';
import '../widgets/article_list_item.dart';

class ArticlesListPage extends StatefulWidget {
  @override
  _ArticlesListPageState createState() => _ArticlesListPageState();
}

class _ArticlesListPageState extends State<ArticlesListPage> {
  late Future<List<Articles>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = ApiService().fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles List'),
      ),
      body: FutureBuilder<List<Articles>>(
        future: futureArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No articles found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Articles article = snapshot.data![index];
                return ArticleListItem(article: article);
              },
            );
          }
        },
      ),
    );
  }
}
