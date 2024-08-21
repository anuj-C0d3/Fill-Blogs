import 'package:flutter/material.dart';
import '../Services/BlogService.dart';
import '../models/Blog.dart';
import 'blog_detail_sreen.dart';



class BlogListScreen extends StatelessWidget {
  final BlogService _blogService = BlogService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.blue,
        shadowColor: Colors.black45,
        elevation: 10,
        iconTheme: IconThemeData(),
        title: Text('Blogs',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

      ),
      body: FutureBuilder<List<Blog>>(
        future: _blogService.fetchBlogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No blogs available.'));
          }

          final blogs = snapshot.data!;
          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return Card(
                color: Colors.white,

                child: ListTile(
                  leading: Image.network(
                      width: 70,blog.imageUrl),
                  title: Text(blog.title,style: TextStyle(fontWeight: FontWeight.w500),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetailScreen( blog:blog,),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
