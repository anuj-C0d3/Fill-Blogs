import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../models/Blog.dart';


class BlogService {
  final String _url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String _adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    try {
      final response = await http.get(Uri.parse(_url), headers: {
        'x-hasura-admin-secret': _adminSecret,
      });

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['blogs'];
        final List<Blog> blogs = jsonData.map((blog) => Blog.fromJson(blog)).toList();

        // Save blogs to Hive for offline access
        final blogBox = Hive.box<Blog>('blogs');
        await blogBox.clear(); // Clear previous data before saving new data
        for (var blog in blogs) {
          blogBox.add(blog);
        }

        return blogs;
      } else {
        throw Exception('Failed to load blogs from API');
      }
    } catch (e) {
      // If API request fails, fall back to local storage
      final blogBox = Hive.box<Blog>('blogs');
      return blogBox.values.toList();
    }
  }
}
