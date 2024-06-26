import 'package:flutter/material.dart';
import 'package:list_view_app/models/articles.dart';

class ArticleListItem extends StatelessWidget {
  final Articles article;

  ArticleListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius:
              BorderRadius.circular(8.0), // Borde redondeado de 8 píxeles
          child: Image.network(
            article.urlToImage,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          article.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.author),
            SizedBox(height: 5),
            Text(article.description),
          ],
        ),
      ),
    );
  }
}
