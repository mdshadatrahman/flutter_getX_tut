import 'package:flutter/material.dart';
import 'package:flutter_getx/my_detail_page.dart';
import 'package:flutter_getx/my_home_page.dart';
import 'package:flutter_getx/recent_contests.dart';
import 'package:get/get.dart';

import 'content_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/content', page: () => ContentPage()),
        GetPage(name: '/detail', page: () => DetailPage()),
        GetPage(name: '/recentContests', page: () => RecentContests()),
      ],
    );
  }
}
