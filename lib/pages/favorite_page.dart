
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_software/models/favorite.dart';
import 'package:school_software/models/food.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  void removeFromFav(Food food, BuildContext context) {
    final favorite = context.read<Favorite>();

    favorite.removeFromFav(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Favorite>(
      builder: (context, value, child) => Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        color: const Color.fromARGB(255, 255, 201, 64),
        animationDuration: const Duration(milliseconds: 300),

        items:  [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/menupage');
          },
          icon: const Icon(Icons.home),),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/favpage');
          },
          icon: const Icon(Icons.favorite),),


      ]),
      appBar: AppBar(
        title: const Text("💗รายการเมนูที่ชื่นชอบ💗"),
        backgroundColor: const Color.fromARGB(255, 255, 201, 64),
        
        ),
        body: ListView.builder(
          itemCount: value.favorite.length,
          itemBuilder: (context, index) {

          final Food food = value.favorite[index];

          final String foodName = food.name;

          final String foodImagePath = food.imagePath;

          return Container(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 250, 225, 135)),
            margin: const EdgeInsets.only(left: 20,top: 20, right: 20),
            child: ListTile(
              title: Text(foodName),
              subtitle: Text(foodImagePath),
              trailing:  IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => removeFromFav(food, context),
              ), 
            ),
          );


        }),
    ),
    );
  }
}