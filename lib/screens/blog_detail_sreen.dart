import 'package:flutter/material.dart';

import '../models/Blog.dart';

class BlogDetailScreen extends StatelessWidget {
  final Blog blog;

  BlogDetailScreen({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black45,
        elevation: 10,
        backgroundColor: Colors.lightBlue,
        title: Text(blog.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(blog.imageUrl,),
            SizedBox(height: 16),
            Text(
              blog.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            // Add more content here if available.
          ],
        ),
      ),
    );
  }
}
