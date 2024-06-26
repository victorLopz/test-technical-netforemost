import 'package:flutter/material.dart';
import 'pages/articles_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articles List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticlesListPage(),
    );
  }
}
