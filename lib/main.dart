import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/Blog.dart';
import 'models/BlogAdapter.dart';
import 'screens/blog_list_screen.dart';


void main() async {
   // Initialize Hive
   await Hive.initFlutter();

   // Register the BlogAdapter
   Hive.registerAdapter(BlogAdapter());

   // Open a Hive box for storing blogs
   await Hive.openBox<Blog>('blogs');

   runApp(MyApp());
}

class MyApp extends StatelessWidget {

   @override
   Widget build(BuildContext context) {

      return MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Fill Blogs',
         theme: ThemeData(
            primarySwatch: Colors.blue,
         ),
         home: BlogListScreen(),
      );
   }
}
