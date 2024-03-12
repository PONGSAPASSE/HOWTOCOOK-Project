import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_software/models/favorite.dart';
import 'package:school_software/pages/favorite_page.dart';
import 'pages/intro_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(
  ChangeNotifierProvider(
    create: (context) => Favorite(),
    child: const MyApp(),
    ),
    );
} 

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage':(context) => const IntroPage(),
        '/menupage':(context) => const MenuPage(),
        '/favpage':(context) => const FavPage(),

      }
    );
  }
}

